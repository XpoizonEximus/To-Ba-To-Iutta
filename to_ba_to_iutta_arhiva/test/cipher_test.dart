import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:cryptography/cryptography.dart" as c;
import 'package:pointycastle/export.dart' as pc;
import 'package:to_ba_to_iutta/domain/authenticator/index.dart';
import 'package:to_ba_to_iutta/domain/cipher/index.dart';
import 'package:to_ba_to_iutta/domain/mean/index.dart';

import 'list_matcher.dart';

void main() async {
  group("Implementation", () {
    test("Block unauthenticated", () async {
      final cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.ofb64,
              BlockCipherParams(BlockCipherEngine.aes,
                  BlockCipherBlockSize.x256, const CipherParams())));

      final cipher = cipherData.newMean;

      final key = await cipher.newKey;
      final nonce = await cipher.newNonce;
      final vars = CipherVariables(key: key, nonce: nonce);

      final test1 = <Bytes>[
        Bytes.fromList([1, 2, 3])
      ];

      final cipherText = await cipher
          .encrypt(StreamQueue(Stream.fromIterable(test1)), vars)
          .toList();
      // for (final chunk in cipherText) {
      //   print(chunk);
      // }
      // print("-------------------");

      final plainText = await cipher
          .decrypt(StreamQueue(Stream.fromIterable(cipherText)), vars)
          .toList();
      // for (final chunk in plainText) {
      //   print(chunk);
      // }

      expect(flatten(plainText), ListMatcher(flatten(test1)));
    });
  });
  group("Library", () {
    test("Cryptography stream blocks", () async {
      final algorithm =
          c.AesCbc.with256bits(macAlgorithm: c.MacAlgorithm.empty);

      final nonce = algorithm.newNonce();
      final key = await algorithm.newSecretKey();

      final random = c.SecureRandom.fast;

      const badBlockSize = 73;
      int n = badBlockSize * nonce.length;
      const additional = [1, 2, 3, 4, 5];

      final test = List<int>.generate(n, (index) => random.nextInt(256));

      final goodBytesTest = <List<int>>[];
      for (int i = 0; i < n; i += nonce.length) {
        goodBytesTest.add(test.sublist(i, i + nonce.length));
      }
      goodBytesTest.add(additional);
      expect(goodBytesTest[0].length, nonce.length);

      final badBytesTest = <List<int>>[];
      for (int i = 0; i < n; i += badBlockSize) {
        badBytesTest.add(test.sublist(i, i + badBlockSize));
      }
      badBytesTest.add(additional);
      expect(badBytesTest[0].length, badBlockSize);

      final goodBytesOutput = (await algorithm
          .encryptStream(Stream.fromIterable(goodBytesTest),
              secretKey: key, nonce: nonce, onMac: (mac) {})
          .toList());

      final badBytesOutput = (await algorithm
          .encryptStream(Stream.fromIterable(badBytesTest),
              secretKey: key, nonce: nonce, onMac: (mac) {})
          .toList());

      expect(goodBytesOutput[0].length, badBytesOutput[0].length);
      // expect(goodBytesOutput.length, goodBytesTest.length);
      expect(goodBytesOutput[0].length, isNot(goodBytesTest[0].length));

      for (List<int> chunk in goodBytesOutput) {
        if (chunk.isNotEmpty) {
          print(chunk.length);
        }
      }
    });

    test("PointyCastle ctr", () async {
      final algorithm = pc.BlockCipher('AES/CTR');
    });
  });
}
