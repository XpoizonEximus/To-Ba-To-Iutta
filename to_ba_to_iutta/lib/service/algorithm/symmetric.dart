import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/index.dart';

class SymmetricAlgorithm extends Algorithm {
  final Cipher cipher;
  final Kdf kdf;

  SymmetricAlgorithm(this.cipher, this.kdf);

  @override
  Stream<Bytes> compute(
      bool forDecryption, StreamQueue<Bytes> input, Bytes key) async* {
    const serializer = BytesSerializer();
    if (forDecryption) {
      final byteInput = DechunkedStreamQueue(input);
      final kdfNonce = await serializer.load(byteInput);
      final cipherNonce = await serializer.load(byteInput);

      final derivedKey = await kdf.process(
          key, KdfVariables(size: cipher.keySize, nonce: kdfNonce),
          syncronized: false);
      yield* cipher.decrypt(StreamQueue(byteInput.restChunks),
          CipherVariables(key: derivedKey, nonce: cipherNonce));
    } else {
      final kdfNonce = await kdf.newNonce;
      final cipherNonce = await cipher.newNonce;

      yield Bytes.fromList(await serializer.serialize(kdfNonce).toList());
      yield Bytes.fromList(await serializer.serialize(cipherNonce).toList());

      final derivedKey = await kdf.process(
          key, KdfVariables(size: cipher.keySize, nonce: kdfNonce),
          syncronized: false);
      yield* cipher.encrypt(
          input, CipherVariables(key: derivedKey, nonce: cipherNonce));
    }
  }
}
