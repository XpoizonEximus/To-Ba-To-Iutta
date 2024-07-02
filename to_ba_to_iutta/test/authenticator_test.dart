import 'package:pointycastle/export.dart' as pc;
import 'package:cryptography/cryptography.dart' as c;
import 'package:flutter_test/flutter_test.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/authenticator/index.dart';
import 'package:to_ba_to_iutta/cryptography/digest/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';

import 'list_matcher.dart';

Future<void> testImplementation(
    Bytes test1,
    Bytes test2,
    Bytes test12,
    ListMatcher match1,
    ListMatcher match2,
    ListMatcher match12,
    Authenticator algorithm,
    AuthenticatorVariables variables) async {
  expect(await algorithm.process(test1, variables), match1);
  expect(await algorithm.process(test2, variables), match2);
  expect(await algorithm.process(test12, variables), match12);

  final reserialized = (await AuthenticatorDataSerializer()
          .load(AuthenticatorDataSerializer().serialize(algorithm.data)))
      .newMean;

  expect(await reserialized.process(test1, variables), match1);
  expect(await reserialized.process(test2, variables), match2);
  expect(await reserialized.process(test12, variables), match12);

  final processor = algorithm.newProcessor(variables);
  processor.put(test1);
  processor.put(test2);
  expect(processor.result, match12);
}

void main() async {
  group("Implementation", () {
    final test1 = Bytes.fromList([1, 2, 3, 4, 5]);
    final test2 = Bytes.fromList([21, 43, 31, 213, 2]);
    final test12 = Bytes.fromList([1, 2, 3, 4, 5, 21, 43, 31, 213, 2]);

    final key = Bytes.fromList([32, 55, 46]);
    final nonce = Bytes.fromList([31, 23, 11, 112, 2]);
    final variables = AuthenticatorVariables(key: key, nonce: nonce);

    test("Empty", () async {
      const algorithm = EmptyAuthenticator(AuthenticatorParams());
      final match1 = ListMatcher(Bytes.fromList([]));
      final match2 = ListMatcher(Bytes.fromList([]));
      final match12 = ListMatcher(Bytes.fromList([]));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("AesCmac", () async {
      final algorithm = AesCmacAuthenticator(FixedLengthKeyAuthenticatorParams(
          const AuthenticatorParams(), KdfData.defaults));
      final tester = pc.CMac.fromCipher(pc.AESEngine());

      final hkey = Bytes.fromList(
          (await c.Blake2b(hashLengthInBytes: 16).hash(key)).bytes);
      final hnonce = Bytes.fromList(
          (await c.Blake2b(hashLengthInBytes: 16).hash(nonce)).bytes);
      final hv = AuthenticatorVariables(key: hkey, nonce: hnonce);

      tester.init(pc.KeyParameter(hkey));

      final match1 = ListMatcher(tester.process(test1));
      final match2 = ListMatcher(tester.process(test2));
      final match12 = ListMatcher(tester.process(test12));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, hv);
    });

    test("Poly1305", () async {
      final algorithm = Poly1305Authenticator(FixedLengthKeyAuthenticatorParams(
          const AuthenticatorParams(), KdfData.defaults));
      final tester = c.Poly1305();

      final hkey = Bytes.fromList((await c.Sha256().hash(key)).bytes);
      final hnonce = Bytes.fromList(
          (await c.Blake2b(hashLengthInBytes: 12).hash(nonce)).bytes);
      final hv = AuthenticatorVariables(key: hkey, nonce: hnonce);

      final match1 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test1, secretKey: c.SecretKey(hkey), nonce: hnonce))
          .bytes));
      final match2 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test2, secretKey: c.SecretKey(hkey), nonce: hnonce))
          .bytes));
      final match12 = ListMatcher(Bytes.fromList((await tester.calculateMac(
              test12,
              secretKey: c.SecretKey(hkey),
              nonce: hnonce))
          .bytes));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, hv);
    });

    test("Hmac - sha256", () async {
      final algorithm = HashAuthenticator(HashAuthenticatorParams(
          const AuthenticatorParams(),
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256))));
      final tester = c.Hmac.sha256();

      final match1 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test1, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));
      final match2 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test2, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));
      final match12 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test12, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Hmac - sha512", () async {
      final algorithm = HashAuthenticator(HashAuthenticatorParams(
          const AuthenticatorParams(),
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x512))));
      final tester = c.Hmac.sha512();

      final match1 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test1, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));
      final match2 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test2, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));
      final match12 = ListMatcher(Bytes.fromList((await tester
              .calculateMac(test12, secretKey: c.SecretKey(key), nonce: nonce))
          .bytes));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Hmac - sha3 - 256", () async {
      final algorithm = HashAuthenticator(HashAuthenticatorParams(
          const AuthenticatorParams(),
          DigestData(DigestImplementation.sha3,
              const ClassicDigestParams(ClassicDigestSize.x256))));
      final tester = pc.HMac(
          pc.SHA3Digest(256),
          Sha3Digest(const ClassicDigestParams(ClassicDigestSize.x256))
              .blockSize) // HMAC SHA-256: block must be 64 bytes
        ..init(pc.KeyParameter(key));

      final match1 = ListMatcher(tester.process(test1));
      final match2 = ListMatcher(tester.process(test2));
      final match12 = ListMatcher(tester.process(test12));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });
  });

  group("Library", () {
    test("Hmac nonce", () async {
      // nonce irrelevant for hmac
      final tester = c.Hmac.sha512();
      final test = [1, 2, 3];
      final key = [4, 5, 6];
      final nonce = [7, 8, 9];

      expect(
          Bytes.fromList(
              (await tester.calculateMac(test, secretKey: c.SecretKey(key)))
                  .bytes),
          ListMatcher(Bytes.fromList((await tester.calculateMac(test,
                  secretKey: c.SecretKey(key), nonce: nonce))
              .bytes)));
    });
  });
}
