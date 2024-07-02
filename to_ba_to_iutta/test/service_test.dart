import 'dart:convert';

import 'package:async/async.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/persistent/provider/asymmetric.dart';
import 'package:to_ba_to_iutta/persistent/provider/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/decrypt.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/encrypt.dart';

import 'list_matcher.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  group("Symmetric decryption", () {
    test("without algorithm", () async {
      final algorithm = await SymmetricAlgorithmProvider().algorithm;

      const inputText = "ceva";
      const keyText = "ceva";

      final inputBytes = Bytes.fromList(utf8.encode(inputText));
      final keyBytes = Bytes.fromList(utf8.encode(keyText));

      print(inputText);
      print(inputBytes);

      final kdfNonce = await algorithm.kdf.newNonce;
      final derivedKey = await algorithm.kdf.process(keyBytes,
          KdfVariables(size: algorithm.cipher.keySize, nonce: kdfNonce),
          syncronized: false);

      final cipherNonce = await algorithm.cipher.newNonce;
      final ciphertextStream = algorithm.cipher.encrypt(
          StreamQueue(Stream.fromFuture(Future.value(inputBytes))),
          CipherVariables(key: derivedKey, nonce: cipherNonce));

      final ciphertextList = List<int>.empty(growable: true);
      await for (final chunk in ciphertextStream) {
        ciphertextList.addAll(chunk);
      }
      print(ciphertextList);

      final outputStream = algorithm.cipher.decrypt(
          StreamQueue(
              Stream.fromFuture(Future.value(Bytes.fromList(ciphertextList)))),
          CipherVariables(key: derivedKey, nonce: cipherNonce));

      final outputList = List<int>.empty(growable: true);
      await for (final chunk in outputStream) {
        outputList.addAll(chunk);
      }
      print(outputList);

      final outputText = utf8.decode(outputList);
      print(outputText);
    });

    test("with algorithm", () async {
      Algorithm algorithm = await SymmetricAlgorithmProvider().algorithm;

      const inputText = "ceva";
      const keyText = "ceva";

      final inputBytes = Bytes.fromList(utf8.encode(inputText));
      final keyBytes = Bytes.fromList(utf8.encode(keyText));

      print(inputText);
      print(inputBytes);

      final ciphertextStream = algorithm.compute(false,
          StreamQueue(Stream.fromFuture(Future.value(inputBytes))), keyBytes);

      final ciphertextList = List<int>.empty(growable: true);
      await for (final chunk in ciphertextStream) {
        ciphertextList.addAll(chunk);
      }
      print(ciphertextList);

      final outputStream = (await SymmetricPackager().load(StreamQueue(
              (SymmetricPackager() as Pacakger).serialize(algorithm))))
          .compute(
              true,
              StreamQueue(Stream.fromFuture(
                  Future.value(Bytes.fromList(ciphertextList)))),
              keyBytes);

      final outputList = List<int>.empty(growable: true);
      await for (final chunk in outputStream) {
        outputList.addAll(chunk);
      }
      print(outputList);

      final outputText = utf8.decode(outputList);
      print(outputText);
    });
    test("With service", () async {
      final se = SymmetricEncryptService();
      se.inputController.text = "ceva";
      se.keyManager.keyController.text = "ceva";

      print(se.inputBytes);

      await se.serve(() => Future.value(false));
      final ciphertextBytes = se.outputBytes;

      print(ciphertextBytes);
      print(se.outputController.text);

      final sd = SymmetricDecryptService();
      sd.inputController.text = base64Encode(ciphertextBytes);
      sd.keyManager.keyController.text = "ceva";

      await sd.serve(() => Future.value(false));
      final outputBytes = sd.outputBytes;
      print(sd.outputBytes);
      print(sd.outputController.text);
    });
  });
  group("Asymmetric encryption & decryption", () {
    test("With algorithm", () async {
      final algorithm = await AsymmetricAlgorithmProvider().algorithm;
      final input = Bytes.fromList([1, 2, 3]);

      final privateKey = await algorithm.asymmetric.newKey;
      final publicKey = algorithm.asymmetric.extractPublicKey(privateKey);

      final privateKeyList = Bytes.fromList(
          await const AsymmetricCipherVariablesSerializer()
              .serialize(privateKey)
              .toList());
      final publicKeyList = Bytes.fromList(
          await const AsymmetricCipherVariablesSerializer()
              .serialize(publicKey)
              .toList());

      final ciphertextStream = algorithm.compute(false,
          StreamQueue(Stream.fromFuture(Future.value(input))), publicKeyList);

      print(flatten(await ciphertextStream.toList()));
    });
  });
  group("Persistent", () {
    test("Settings Provider", () async {
      final provider = SymmetricAlgorithmProvider();
      final index = CipherImplementation.values.indexOf(
          (await provider.algorithm).cipher.data.implementation
              as CipherImplementation);
      print(index);

      final provider2 = SymmetricAlgorithmProvider();
      await provider2.setAlgorithm(SymmetricAlgorithm(
          CipherData(
                  CipherImplementation.values[index - 1],
                  CipherImplementation
                      .values[index - 1].requiredParams.defaults)
              .newMean,
          (await provider.algorithm).kdf));

      final index2 = CipherImplementation.values.indexOf(
          (await provider.algorithm).cipher.data.implementation
              as CipherImplementation);
      print(index2);

      final index3 = CipherImplementation.values.indexOf(
          (await provider2.algorithm).cipher.data.implementation
              as CipherImplementation);
      print(index3);
    });
  });
}
