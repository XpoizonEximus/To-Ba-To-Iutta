import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:cryptography/cryptography.dart" as c;
import 'package:pointycastle/api.dart';
import 'package:pointycastle/export.dart' as pc;
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/authenticator/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';

import 'list_matcher.dart';

Future testImplementation(CipherData data) async {
  final cipher = data.newMean;

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

  final plainText = await (await CipherDataSerializer()
          .load(StreamQueue(CipherDataSerializer().serialize(data))))
      .newMean
      .decrypt(StreamQueue(Stream.fromFuture(Future.value(flatten(cipherText)))), vars)
      .toList();
  // for (final chunk in plainText) {
  //   print(chunk);
  // }
  // print("-------------------");
  // print("-------------------");

  expect(flatten(plainText), ListMatcher(flatten(test1)));
}

void main() async {
  group("Implementation", () {
    test("Block unauthenticated", () async {
      CipherData cipherData;

      cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.cbc,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.ctr,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.cfb64,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.ofb64,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedBlock,
          UnauthenticatedBlockCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedModeOfOperation.ige,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);
    });

    test("Block authenticated", () async {
      CipherData cipherData;

      cipherData = CipherData(
          CipherImplementation.authenticatedBlock,
          AuthenticatedBlockCipherParams(AuthenticatedModeOfOperation.gcm,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.authenticatedBlock,
          AuthenticatedBlockCipherParams(AuthenticatedModeOfOperation.ccm,
              BlockCipherParams(BlockCipherEngine.aes, const CipherParams())));
      await testImplementation(cipherData);
    });

    test("Stream unauthenticated", () async {
      CipherData cipherData;

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.chacha20,
              20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.chacha20,
              21,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.chacha7539,
              20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.chacha7539,
              21,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.salsa20,
              20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.unauthenticatedStream,
          UnauthenticatedStreamCipherParams(
              AuthenticatorData.defaults,
              UnauthenticatedStreamEngine.xchacha20,
              20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);
    });

    test("Stream authenticated", () async {
      CipherData cipherData;

      cipherData = CipherData(
          CipherImplementation.authenticatedStream,
          AuthenticatedStreamCipherParams(AuthenticatedStreamEngine.chacha20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);

      cipherData = CipherData(
          CipherImplementation.authenticatedStream,
          AuthenticatedStreamCipherParams(AuthenticatedStreamEngine.xchacha20,
              StreamCipherParams(const CipherParams())));
      await testImplementation(cipherData);
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

    test("PointyCastle ccm", () async {
      final algorithm = pc.CCMBlockCipher(pc.AESEngine());

      final key = await SecureBytesGenerator(algorithm.blockSize).get;
      final nonce = await const SecureBytesGenerator(12).get;

      algorithm.init(true, pc.ParametersWithIV(KeyParameter(key), nonce));

      final input = Bytes.fromList(List.filled(algorithm.blockSize * 4 + 3, 1));

      final output1 = algorithm.process(input);

      algorithm.processBlock(input.sublist(0, 19), 0, output1, 0);
      final output2 = algorithm.process(input.sublist(19, input.length));

      expect(output1, ListMatcher(output2));
    });

    test("PointyCastle gcm", () async {
      final algorithm = pc.GCMBlockCipher(pc.AESEngine());

      final key = await SecureBytesGenerator(algorithm.blockSize).get;
      final nonce = await const SecureBytesGenerator(12).get;

      algorithm.init(true, pc.ParametersWithIV(KeyParameter(key), nonce));

      final input = Bytes.fromList(List.filled(algorithm.blockSize * 2, 1));

      final output1 = algorithm.process(input);
      print(output1);

      algorithm.reset();

      final output2 = Bytes(100);
      algorithm.processBytes(input, 0, algorithm.blockSize + 1, output2, 0);
      print(output2);
      algorithm.processBytes(
          input, algorithm.blockSize + 1, algorithm.blockSize - 1, output2, 0);
      print(output2);
      algorithm.doFinal(output2, 0);
      print(output2);
      print(algorithm.blockSize);
      print(algorithm.macSize);
    });
  });
}
