import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:to_ba_to_iutta/cryptography/decryptor/index.dart';

class SymmetricDecryptor extends Decryptor {
  @override
  Future<Uint8List> decrypt(Uint8List data, Uint8List key) async {
    final decryptAlgorithm = AesCtr.with256bits(macAlgorithm: Poly1305());
    final derivationAlgorythm =
        Argon2id(parallelism: 1, memory: 19000, iterations: 2, hashLength: 32);

    final secretKey = await derivationAlgorythm
        .deriveKey(secretKey: SecretKey(key), nonce: [1, 2, 3]);

    final clearText = await decryptAlgorithm.decrypt(
        SecretBox.fromConcatenation(data,
            nonceLength: decryptAlgorithm.nonceLength,
            macLength: decryptAlgorithm.macAlgorithm.macLength,
            copy: false),
        secretKey: secretKey);

    return Uint8List.fromList(clearText);
  }
}
