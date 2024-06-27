import 'dart:math';

import 'package:pointycastle/export.dart' as pc;
import 'package:cryptography/cryptography.dart' as c;
import 'package:flutter_test/flutter_test.dart';
import 'package:to_ba_to_iutta/cryptography/digest/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/cryptography/mean/index.dart';

import 'list_matcher.dart';

Future<void> testImplementation(
    Bytes test1,
    Bytes test2,
    Bytes test12,
    ListMatcher match1,
    ListMatcher match2,
    ListMatcher match12,
    Kdf algorithm,
    KdfVariables variables) async {
  expect(await algorithm.process(test1, variables), match1);
  expect(await algorithm.process(test2, variables), match2);
  expect(await algorithm.process(test12, variables), match12);

  final reserialized = (await KdfDataSerializer()
          .load(KdfDataSerializer().serialize(algorithm.data)))
      .newMean;

  final reserializedVars = await const KdfVariablesSerializer()
      .load(const KdfVariablesSerializer().serialize(variables));

  expect(await reserialized.process(test1, reserializedVars), match1);
  expect(await reserialized.process(test2, reserializedVars), match2);
  expect(await reserialized.process(test12, reserializedVars), match12);
}

void main() async {
  group("Implementation", () {
    final test1 = Bytes.fromList([1, 2, 3, 4, 5]);
    final test2 = Bytes.fromList([21, 43, 31, 213, 2]);
    final test12 = Bytes.fromList([1, 2, 3, 4, 5, 21, 43, 31, 213, 2]);

    final nonce = Bytes.fromList([31, 23, 11, 112, 2]);
    const size = 64;
    final variables = KdfVariables(size: size, nonce: nonce);

    test("Argon2id", () async {
      final params =
          KdfParamsImplementation.argon2Id.defaults as Argon2IdKdfParams;
      final algorithm = Argon2IdKdf(params);
      final tester = c.Argon2id(
          hashLength: variables.size,
          iterations: params.iterations,
          parallelism: params.parallelism,
          memory: params.memory);

      final match1 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test1), nonce: variables.nonce))
          .extractBytes()));

      final match2 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test2), nonce: variables.nonce))
          .extractBytes()));

      final match12 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test12), nonce: variables.nonce))
          .extractBytes()));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Hkdf - sha-2-256", () async {
      final algorithm = HashKdf(HashKdfParams(DigestData(
          DigestImplementation.sha2,
          const ClassicDigestParams(ClassicDigestSize.x256))));
      final tester =
          c.Hkdf(hmac: c.Hmac.sha256(), outputLength: variables.size);

      final match1 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test1), nonce: variables.nonce))
          .extractBytes()));

      final match2 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test2), nonce: variables.nonce))
          .extractBytes()));

      final match12 = ListMatcher(Bytes.fromList(await (await tester.deriveKey(
              secretKey: c.SecretKey(test12), nonce: variables.nonce))
          .extractBytes()));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Hkdf - sha-2-256 (2)", () async {
      final algorithm = HashKdf(HashKdfParams(DigestData(
          DigestImplementation.sha2,
          const ClassicDigestParams(ClassicDigestSize.x256))));
      final tester = pc.HKDFKeyDerivator(pc.SHA256Digest());

      tester.init(pc.HkdfParameters(test1, variables.size, variables.nonce));
      final result1 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result1, 0);
      final match1 = ListMatcher(result1);

      tester.init(pc.HkdfParameters(test2, variables.size, variables.nonce));
      final result2 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result2, 0);
      final match2 = ListMatcher(result2);

      tester.init(pc.HkdfParameters(test12, variables.size, variables.nonce));
      final result12 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result12, 0);
      final match12 = ListMatcher(result12);

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Hkdf - sha-3-256", () async {
      final algorithm = HashKdf(HashKdfParams(DigestData(
          DigestImplementation.sha3,
          const ClassicDigestParams(ClassicDigestSize.x256))));
      final tester = pc.HKDFKeyDerivator(pc.SHA3Digest(256));

      tester.init(pc.HkdfParameters(test1, variables.size, variables.nonce));
      final result1 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result1, 0);
      final match1 = ListMatcher(result1);

      tester.init(pc.HkdfParameters(test2, variables.size, variables.nonce));
      final result2 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result2, 0);
      final match2 = ListMatcher(result2);

      tester.init(pc.HkdfParameters(test12, variables.size, variables.nonce));
      final result12 = Bytes(tester.keySize);
      tester.deriveKey(null, 0, result12, 0);
      final match12 = ListMatcher(result12);

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });

    test("Scrypt", () async {
      final params = KdfParamsImplementation.scrypt.defaults as ScryptKdfParams;
      final algorithm = KdfImplementation.scrypt.newMean(params);

      final tester = pc.Scrypt();
      tester.init(pc.ScryptParameters(
          pow(2, params.costFactorExponent).toInt(),
          params.blockSizeFactor,
          params.parallelisationFactor,
          variables.size,
          variables.nonce));

      final match1 = ListMatcher(tester.process(test1));
      final match2 = ListMatcher(tester.process(test2));
      final match12 = ListMatcher(tester.process(test12));

      await testImplementation(
          test1, test2, test12, match1, match2, match12, algorithm, variables);
    });
  });

  group("Library", () {
    test("Hkdf equivalency", () async {
      const size = 64;
      final key = Bytes.fromList([1, 2, 3]);
      final nonce = Bytes.fromList([2, 43, 2]);

      final tester1 = c.Hkdf(hmac: c.Hmac.sha256(), outputLength: size);
      final tester2 = pc.HKDFKeyDerivator(pc.SHA256Digest());

      final result1 = Bytes.fromList(await (await tester1.deriveKey(
              secretKey: c.SecretKey(key), nonce: nonce))
          .extractBytes());

      tester2.init(pc.HkdfParameters(key, size, nonce));
      final result2 = Bytes(tester2.keySize);
      tester2.deriveKey(null, 0, result2, 0);

      expect(result1, ListMatcher(result2));
    });

    test("Hkdf equivalency 2", () async {
      const size = 64;
      final key = Bytes.fromList([1, 2, 3]);
      final nonce = Bytes.fromList([2, 43, 2]);

      final digest =
          Sha3Digest(const ClassicDigestParams(ClassicDigestSize.x256));

      final tester1 = c.Hkdf(
          hmac: c.Hmac(PackageCryptographyDigestAdapter(digest)),
          outputLength: size);
      final tester2 = pc.HKDFKeyDerivator(pc.SHA3Digest(256));

      final result1 = Bytes.fromList(await (await tester1.deriveKey(
              secretKey: c.SecretKey(key), nonce: nonce))
          .extractBytes());

      tester2.init(pc.HkdfParameters(key, size, nonce));
      final result2 = Bytes(tester2.keySize);
      tester2.deriveKey(null, 0, result2, 0);

      expect(result1, ListMatcher(result2));
    });
  });
}
