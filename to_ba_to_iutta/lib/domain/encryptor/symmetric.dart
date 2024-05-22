import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:to_ba_to_iutta/domain/encryptor/index.dart';

class SymmetricEncryptor extends Encryptor {
  @override
  Future<Uint8List> encrypt(Uint8List data, Uint8List key) async {
    final encryptAlgorithm = AesCtr.with256bits(macAlgorithm: Poly1305());
    final derivationAlgorythm =
        Argon2id(parallelism: 1, memory: 19000, iterations: 2, hashLength: 32);

    final secretKey = await derivationAlgorythm
        .deriveKey(secretKey: SecretKey(key), nonce: [1, 2, 3]);

    final secretBox =
        await encryptAlgorithm.encrypt(data, secretKey: secretKey);

    return Uint8List.fromList(secretBox.concatenation());
  }
}
