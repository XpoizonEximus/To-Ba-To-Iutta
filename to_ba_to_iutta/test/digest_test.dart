import "dart:isolate";
import "dart:typed_data";

import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import 'package:flutter_test/flutter_test.dart';
import "package:pointycastle/api.dart";

import "package:to_ba_to_iutta/domain/digest/index.dart";
import "package:pointycastle/export.dart" as pc;
import "package:cryptography/cryptography.dart" as c;

import "list_matcher.dart";

Future<void> testImplementation(DigestData data, Uint8List test1,
    Uint8List test2, ListMatcher match1, ListMatcher match2) async {
  final mean = data.newMean;

  expect(mean.process(test1), match1);
  expect(mean.process(test2), match2);
  expect(mean.process(test1), isNot(match2));
  expect(mean.process(test2), isNot(match1));

  final pca = PackagePointyCastleDigestAdapter(mean);

  expect(pca.process(test1), match1);
  expect(pca.process(test2), match2);
  expect(pca.process(test1), isNot(match2));
  expect(pca.process(test2), isNot(match1));

  final ca = PackageCryptographyDigestAdapter(mean);

  expect(Uint8List.fromList((await ca.hash(test1)).bytes), match1);
  expect(Uint8List.fromList((await ca.hash(test2)).bytes), match2);
  expect(Uint8List.fromList((await ca.hash(test1)).bytes), isNot(match2));
  expect(Uint8List.fromList((await ca.hash(test2)).bytes), isNot(match1));

  final algorithm = (await const DigestDataSerializer()
          .load(const DigestDataSerializer().serialize(mean.data)))
      .newMean;

  expect(algorithm.process(test1), match1);
  expect(algorithm.process(test2), match2);
  expect(algorithm.process(test1), isNot(match2));
  expect(algorithm.process(test2), isNot(match1));
}

void main() async {
  group("Implementation", () {
    final test1 = Uint8List.fromList([1, 2, 3, 4, 5]);
    final test2 = Uint8List.fromList([7, 8, 9]);

    test("SM3", () async {
      final tester = pc.SM3Digest();
      await testImplementation(
          DigestData(DigestImplementation.sm3, const DigestParams()),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));
    });

    test("SHA-2", () async {
      pc.Digest tester;

      tester = pc.SHA224Digest();
      await testImplementation(
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x224)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA256Digest();
      await testImplementation(
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA384Digest();
      await testImplementation(
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x384)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA512Digest();
      await testImplementation(
          DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x512)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));
    });

    test("SHA-3", () async {
      pc.Digest tester;

      tester = pc.SHA3Digest(224);
      await testImplementation(
          DigestData(DigestImplementation.sha3,
              const ClassicDigestParams(ClassicDigestSize.x224)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA3Digest(256);
      await testImplementation(
          DigestData(DigestImplementation.sha3,
              const ClassicDigestParams(ClassicDigestSize.x256)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA3Digest(384);
      await testImplementation(
          DigestData(DigestImplementation.sha3,
              const ClassicDigestParams(ClassicDigestSize.x384)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.SHA3Digest(512);
      await testImplementation(
          DigestData(DigestImplementation.sha3,
              const ClassicDigestParams(ClassicDigestSize.x512)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));
    });

    test("Keccak", () async {
      pc.Digest tester;

      tester = pc.KeccakDigest(224);
      await testImplementation(
          DigestData(DigestImplementation.keccak,
              const ClassicDigestParams(ClassicDigestSize.x224)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.KeccakDigest(256);
      await testImplementation(
          DigestData(DigestImplementation.keccak,
              const ClassicDigestParams(ClassicDigestSize.x256)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.KeccakDigest(384);
      await testImplementation(
          DigestData(DigestImplementation.keccak,
              const ClassicDigestParams(ClassicDigestSize.x384)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));

      tester = pc.KeccakDigest(512);
      await testImplementation(
          DigestData(DigestImplementation.keccak,
              const ClassicDigestParams(ClassicDigestSize.x512)),
          test1,
          test2,
          ListMatcher(tester.process(test1)),
          ListMatcher(tester.process(test2)));
    });

    test("Blake", () async {
      c.HashAlgorithm tester;

      tester = c.Blake2b(hashLengthInBytes: 64);
      await testImplementation(
          DigestData(
              DigestImplementation.blake,
              const BlakeDigestParams(
                  BlakeSize(64, BlakeType.x2b), BlakeType.x2b)),
          test1,
          test2,
          ListMatcher(Uint8List.fromList((await tester.hash(test1)).bytes)),
          ListMatcher(Uint8List.fromList((await tester.hash(test2)).bytes)));

      tester = c.Blake2b(hashLengthInBytes: 1);
      await testImplementation(
          DigestData(
              DigestImplementation.blake,
              const BlakeDigestParams(
                  BlakeSize(1, BlakeType.x2b), BlakeType.x2b)),
          test1,
          test2,
          ListMatcher(Uint8List.fromList((await tester.hash(test1)).bytes)),
          ListMatcher(Uint8List.fromList((await tester.hash(test2)).bytes)));

      tester = c.Blake2b(hashLengthInBytes: 32);
      await testImplementation(
          DigestData(
              DigestImplementation.blake,
              const BlakeDigestParams(
                  BlakeSize(32, BlakeType.x2b), BlakeType.x2b)),
          test1,
          test2,
          ListMatcher(Uint8List.fromList((await tester.hash(test1)).bytes)),
          ListMatcher(Uint8List.fromList((await tester.hash(test2)).bytes)));

      tester = c.Blake2s(hashLengthInBytes: 32);
      await testImplementation(
          DigestData(
              DigestImplementation.blake,
              const BlakeDigestParams(
                  BlakeSize(32, BlakeType.x2s), BlakeType.x2s)),
          test1,
          test2,
          ListMatcher(Uint8List.fromList((await tester.hash(test1)).bytes)),
          ListMatcher(Uint8List.fromList((await tester.hash(test2)).bytes)));

      tester = c.Blake2s(hashLengthInBytes: 1);
      await testImplementation(
          DigestData(
              DigestImplementation.blake,
              const BlakeDigestParams(
                  BlakeSize(1, BlakeType.x2s), BlakeType.x2s)),
          test1,
          test2,
          ListMatcher(Uint8List.fromList((await tester.hash(test1)).bytes)),
          ListMatcher(Uint8List.fromList((await tester.hash(test2)).bytes)));
    });
  });

  group("Adapters", () {
    test("Cryptography HashSink", () async {
      // final tester = c.Sha256().toSync().newHashSink();
      // final tested = PackageCryptographyDigestAdapter(DigestData(
      //             DigestImplementation.sha2,
      //             const ClassicDigestParams(ClassicDigestSize.x256))
      //         .newMean)
      //     .toSync()
      //     .newHashSink();

      // final test = [1, 2, 3];

      // expect(tested.length, tester.length);

      // tester.add(test);
      // tested.add(test);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.close();
      // tested.close();

      // expect(Uint8List.fromList(tested.hashSync().bytes),
      //     ListMatcher(Uint8List.fromList(tester.hashSync().bytes)));

      // expect(tested.length, tester.length);

      // expect(() => tester.add(test), throwsStateError);
      // expect(() => tested.add(test), throwsStateError);

      // tester.reset();
      // tested.reset();

      // expect(tested.length, tester.length);

      // tester.add(test);
      // tested.add(test);

      // expect(tested.length, tester.length);

      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.reset();
      // tested.reset();

      // expect(tested.length, tester.length);

      // List<int> test2 = [];
      // for (int i = 1; i <= 254; i++) {
      //   test2.add(i);
      // }

      // tester.add(test2);
      // tested.add(test2);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.add(test2);
      // tested.add(test2);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.add(test2);
      // tested.add(test2);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.add(test2);
      // tested.add(test2);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);

      // tester.add(test2);
      // tested.add(test2);
      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));

      // expect(tested.length, tester.length);
    });

    test("Cryptography Hash Sink 2", () async {
      final tester = c.Sha256().toSync().newHashSink();
      final tested = PackageCryptographyDigestAdapter(DigestData(
                  DigestImplementation.sha2,
                  const ClassicDigestParams(ClassicDigestSize.x256))
              .newMean)
          .toSync()
          .newHashSink();

      List<int> test1 = [];
      for (int i = 0; i < 64; i++) {
        test1.add(i);
      }
      List<int> test2 = [];
      for (int i = 64; i < 128; i++) {
        test2.add(i);
      }
      List<int> test3 = [1, 2, 3];
      List<int> test4 = [];
      for (int i = 128; i < 160; i++) {
        test4.add(i);
      }

      // expect(tested.length, tester.length);

      // tested.reset();
      // tester.reset();
      // // expect(tested.length, tester.length);

      // tested.addSlice(test1, 0, 64, false);
      // tester.addSlice(test1, 0, 64, false);
      // // expect(tested.length, tester.length);

      // tested.reset();
      // tester.reset();
      // // expect(tested.length, tester.length);

      // tested.addSlice(test2, 0, 64, false);
      // tester.addSlice(test2, 0, 64, false);
      // // expect(tested.length, tester.length);

      // tested.addSlice(test3, 0, 3, true);
      // tester.addSlice(test3, 0, 3, true);
      // // expect(tested.length, tester.length);

      // tested.close();
      // tester.close();
      // // expect(tested.length, tester.length);

      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));
      // // expect(tested.length, tester.length);

      // tested.addSlice(test4, 0, 32, true);
      // tester.addSlice(test4, 0, 32, true);
      // // expect(tested.length, tester.length);

      // tested.close();
      // tester.close();
      // // expect(tested.length, tester.length);

      // expect(tested.hashBytes, ListMatcher(tester.hashBytes));
      // // expect(tested.length, tester.length);
    });

    test("Cryptography Hash Sink 3", () async {
      final tester1 = c.Sha256().toSync().newHashSink();
      final tested1 = c.Sha256().toSync().newHashSink();

      final tester2 = c.Sha256().toSync().newHashSink();
      final tested2 = c.Sha256().toSync().newHashSink();

      List<int> test1 = [];
      for (int i = 0; i < 64; i++) {
        test1.add(i);
      }
      List<int> test2 = [];
      for (int i = 64; i < 128; i++) {
        test2.add(i);
      }
      List<int> test3 = [1, 2, 3];
      List<int> test4 = [];
      for (int i = 128; i < 160; i++) {
        test4.add(i);
      }

      // expect(tested.length, tester.length);

      tested1.reset();
      tester1.reset();
      // expect(tested.length, tester.length);

      tested1.addSlice(Uint8List.fromList(test1.sublist(0, 64)), 0, 64, false);
      tester1.addSlice(test1, 0, 64, false);
      // expect(tested.length, tester.length);

      tested2.reset();
      tester2.reset();
      // expect(tested.length, tester.length);

      tested2.addSlice(Uint8List.fromList(test2.sublist(0, 64)), 0, 64, false);
      tester2.addSlice(test2, 0, 64, false);
      // expect(tested.length, tester.length);

      tested1.addSlice(Uint8List.fromList(test3.sublist(0, 3)), 0, 3, true);
      tester1.addSlice(test3, 0, 3, true);
      // expect(tested.length, tester.length);

      tested1.close();
      tester1.close();
      // expect(tested.length, tester.length);

      expect(tested1.hashBytes, ListMatcher(tester1.hashBytes));
      // expect(tested.length, tester.length);

      tested2.addSlice(Uint8List.fromList(test4.sublist(0, 32)), 0, 32, true);
      tester2.addSlice(test4, 0, 32, true);
      // expect(tested.length, tester.length);

      tested2.close();
      tester2.close();
      // expect(tested.length, tester.length);

      expect(tested2.hashBytes, ListMatcher(tester2.hashBytes));
      // expect(tested.length, tester.length);
    });

    test("Cryptography Hash Sink 4", () async {
      final tester1 = c.Sha256().toSync().newHashSink();
      final tested1 = DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256))
          .newMean
          .newProcessor(syncronized: true);

      final tester2 = c.Sha256().toSync().newHashSink();
      final tested2 = DigestData(DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256))
          .newMean
          .newProcessor(syncronized: true);

      List<int> test1 = [];
      for (int i = 0; i < 64; i++) {
        test1.add(i);
      }
      List<int> test2 = [];
      for (int i = 64; i < 128; i++) {
        test2.add(i);
      }
      List<int> test3 = [1, 2, 3];
      List<int> test4 = [];
      for (int i = 128; i < 160; i++) {
        test4.add(i);
      }

      // expect(tested.length, tester.length);

      tested1.result;
      tested1.put(Uint8List.fromList([]));
      tester1.reset();
      // expect(tested.length, tester.length);

      tested1.put(Uint8List.fromList(test1));
      tester1.addSlice(test1, 0, 64, false);
      // expect(tested.length, tester.length);

      tested2.result;
      tested2.put(Uint8List.fromList([]));
      tester2.reset();
      // expect(tested.length, tester.length);

      tested2.put(Uint8List.fromList(test2));
      tester2.addSlice(test2, 0, 64, false);
      // expect(tested.length, tester.length);

      tested1.put(Uint8List.fromList(test3));
      tester1.addSlice(test3, 0, 3, true);
      // expect(tested.length, tester.length);

      tester1.close();
      // expect(tested.length, tester.length);

      // expect(tested1.peek, ListMatcher(tester1.hashBytes));
      // expect(tested.length, tester.length);

      tested2.put(Uint8List.fromList(test4));
      tester2.addSlice(test4, 0, 32, true);
      // expect(tested.length, tester.length);

      tester2.close();
      // expect(tested.length, tester.length);

      // expect(tested2.peek, ListMatcher(tester2.hashBytes));
      // expect(tested.length, tester.length);
    });

    test("Cryptography Hash Sink 5 - proof of slice fail", () async {
      final tester = c.Sha256().toSync().newHashSink();
      final tested = c.Sha256().toSync().newHashSink();

      final test1 = [1, 2, 3];
      final test2 = [4, 5, 6];
      final test3 = [7, 8, 9];

      tester.add(test1);
      tested.addSlice(test1, 0, test1.length, false);

      tester.add(test2);
      tested.addSlice(test2, 0, test2.length, false);

      tester.add(test3);
      tested.addSlice(test3, 0, test3.length, true);

      expect(tested.hashBytes, isNot(ListMatcher(tester.hashBytes)));
    });

    test("Cryptography Hash Sink 6 - slice tester", () async {
      final tester = c.Sha256().toSync().newHashSink();

      var prevBytes = tester.hashBytes;
      for (int i = 0; i < 1000; i++) {
        tester.addSlice(List.generate(i, (index) => index), 0, i, false);
        try {
          expect(tester.hashBytes, ListMatcher(prevBytes));
        } catch (e) {
          prevBytes = tester.hashBytes;
          // print(i);
        }
      }
    });

    test("Cryptography Hash Sink 6 - update on close", () async {
      final tester = c.Sha256().toSync().newHashSink();
      final match = ListMatcher(
          Uint8List.fromList(tester.hashBytes.toList(growable: false)));
      tester.add([1, 2, 3]);
      expect(tester.hashBytes, match);
      tester.close();
      expect(tester.hashBytes, isNot(match));
    });

    test("Cryptography with Cryptography Hmac", () async {
      final tester = c.Hmac(c.Sha256());
      final tested = c.Hmac(PackageCryptographyDigestAdapter(DigestData(
              DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256))
          .newMean));

      expect(tested.macLength, tester.macLength);
      expect(tested.keyStreamUsed, tester.keyStreamUsed);
      expect(tested.supportsAad, tester.supportsAad);
      expect(tested.supportsKeyStreamIndex, tester.supportsKeyStreamIndex);

      final key = c.SecretKey([182, 42, 44]);
      final test1 = [1, 2, 3];
      final match1 = ListMatcher(Uint8List.fromList(
          (await tester.calculateMac(test1, secretKey: key)).bytes));

      expect(
          Uint8List.fromList(
              (await tested.calculateMac(test1, secretKey: key)).bytes),
          match1);
    });

    test("Cryptography with Cryptography Hmac 2 - test hash bytes access",
        () async {
      final authenticator = c.Hmac(PackageCryptographyDigestAdapter(DigestData(
              DigestImplementation.sha2,
              const ClassicDigestParams(ClassicDigestSize.x256))
          .newMean));

      final tester = c.AesCbc.with128bits(macAlgorithm: authenticator);

      final key = await tester.newSecretKey();
      List<int> test1 = [];
      for (int i = 1; i <= 100000000; i++) {
        test1.add(i);
      }

      (await tester.encrypt(test1, secretKey: key)).mac.bytes;
      // print((await tester.encrypt(test1, secretKey: key)).mac.bytes);
    });

    test("Cryptography for Cryptography", () async {
      final data = DigestData(DigestImplementation.sha2,
          const ClassicDigestParams(ClassicDigestSize.x256));
      final mean = data.newMean;

      final tester = c.AesCbc.with128bits(macAlgorithm: c.Hmac(c.Sha256()));
      final tested = c.AesCbc.with128bits(
          macAlgorithm: c.Hmac(PackageCryptographyDigestAdapter(mean)));

      final key = await tester.newSecretKey();
      final nonce = tester.newNonce();

      final test = [1, 2, 3];

      final match = ListMatcher(Uint8List.fromList(
          (await tester.encrypt(test, secretKey: key, nonce: nonce))
              .mac
              .bytes));

      final testResult = Uint8List.fromList(
          (await tested.encrypt(test, secretKey: key, nonce: nonce)).mac.bytes);

      expect(testResult, match);
    });

    test("PointyCastle for Cryptography", () async {
      final data = DigestData(DigestImplementation.sha3,
          const ClassicDigestParams(ClassicDigestSize.x256));
      final mean = data.newMean;

      final tested = c.Hmac(PackageCryptographyDigestAdapter(mean));

      final cipher = c.AesCbc.with128bits(macAlgorithm: tested);

      final key = await cipher.newSecretKey();
      final nonce = cipher.newNonce();

      final cipherbox =
          await cipher.encrypt([1, 2, 3], secretKey: key, nonce: nonce);

      final tester = pc.HMac(pc.SHA3Digest(256), mean.blockSize)
        ..init(KeyParameter(Uint8List.fromList(await key.extractBytes())));

      expect(
          Uint8List.fromList(cipherbox.mac.bytes),
          ListMatcher(
              tester.process(Uint8List.fromList(cipherbox.cipherText))));
    });
  });

  group("Library", () {
    test("PointyCastle", () async {
      pc.SHA256Digest tester1 = pc.SHA256Digest();
      pc.SHA256Digest tester2 = pc.SHA256Digest();

      final test1 = Uint8List.fromList([1, 2, 3]);
      final test2 = Uint8List.fromList([4, 5, 6]);

      final test12 = Uint8List(test1.length + test2.length);
      test12.setRange(0, test1.length, test1);
      test12.setRange(test1.length, test1.length + test2.length, test2);

      expect(tester1.process(test1), ListMatcher(tester2.process(test1)));
      tester1.reset();
      expect(tester1.process(test1), ListMatcher(tester2.process(test1)));

      tester1.reset();
      tester2.reset();

      expect(tester1.process(test1), ListMatcher(tester2.process(test1)));
      tester1.process(test1);
      expect(tester1.process(test1), ListMatcher(tester2.process(test1)));

      tester1.reset();
      tester2.reset();

      tester1.process(test1);
      tester1.process(test1);
      tester1.process(test1);
      expect(tester1.process(test1), ListMatcher(tester1.process(test1)));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      Uint8List res = Uint8List(256 ~/ 8);
      tester1.doFinal(res, 0);
      expect(res, ListMatcher(tester2.process(test1)));
      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      expect(tester1.process(test2), ListMatcher(tester2.process(test12)));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      tester1.process(test2);
      expect(
          tester1.process(test2), isNot(ListMatcher(tester2.process(test12))));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      expect(
          tester1.process(test1), isNot(ListMatcher(tester1.process(test1))));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      expect(tester1.process(Uint8List.fromList([])),
          ListMatcher(tester2.process(test1)));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      tester1.doFinal(res, 0); // doFinal resets the digest
      expect(res, tester2.process(test1));
      tester1.update(test2, 0, test2.length);
      tester1.doFinal(res, 0);
      expect(res, tester2.process(test2));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      expect(tester1.process(test2),
          ListMatcher(tester2.process(test12))); // process resets the digest
      tester1.update(test1, 0, test1.length);
      tester1.doFinal(res, 0);
      expect(res, ListMatcher(tester2.process(test1)));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      tester2.update(test1, 0, test1.length);
      tester1.update(test2, 0, test2.length);

      tester1.doFinal(res, 0);
      expect(res, ListMatcher(tester2.process(test2)));

      tester2.reset();
      expect(tester1.process(test1), ListMatcher(tester2.process(test1)));

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);
      var res1 = tester1.process(test2);
      expect(res1, ListMatcher(tester2.process(test12)));
      tester1.doFinal(res, 0);

      tester1.reset();
      tester2.reset();

      tester1.update(test1, 0, test1.length);

      final receive = ReceivePort();
      receive.sendPort.send(tester1);
      pc.SHA256Digest testerc = (await receive.first
          .whenComplete(() => receive.close())) as pc.SHA256Digest;

      expect(testerc.process(test2), ListMatcher(tester1.process(test2)));
    });

    test("Cryptography", () async {
      final digest = c.Sha256();
      final asyncSink = digest.newHashSink();
      final syncSink = digest.toSync().newHashSink();

      final test1 = [1, 2, 3];
      final test2 = [4, 5, 6];
      final test12 = [1, 2, 3, 4, 5, 6];

      final matcher1 =
          ListMatcher(Uint8List.fromList((await digest.hash(test1)).bytes));
      final matcher2 =
          ListMatcher(Uint8List.fromList((await digest.hash(test2)).bytes));
      final matcher12 =
          ListMatcher(Uint8List.fromList((await digest.hash(test12)).bytes));

      syncSink.add(test1);
      // expect(syncSink.hashBytes, matcher1);

      // print((await digest.hash(test1)).bytes);
      // print((await digest.hash([])).bytes);
      // print(syncSink.hashBytes.toList());
      syncSink.close();
      // print(syncSink.hashSync().bytes);
    });

    test("Syncer", () async {
      late int middleWare;

      Future<int> asyncNeeded() async {
        await Future.delayed(const Duration(seconds: 1));
        return 10;
      }

      int syncThatNeedsAsync() {
        return middleWare;
      }

      Future<void> asyncHelper() async {
        middleWare = await asyncNeeded();
      }

      Future<int> asyncCaller() async {
        await asyncHelper();
        return syncThatNeedsAsync();
      }

      expect(await asyncCaller(), 10);
    });
  });
}
