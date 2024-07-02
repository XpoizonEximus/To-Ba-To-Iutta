import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/index.dart';

class AsymmetricAlgorithm extends Algorithm {
  final AsymmetricCipher asymmetric;
  final Cipher symmetric;

  AsymmetricAlgorithm(this.asymmetric, this.symmetric);

  @override
  Stream<Bytes> compute(
      bool forDecryption, StreamQueue<Bytes> input, Bytes key) async* {
    const serializer = BytesSerializer();

    final asymmetricVariables =
        await const AsymmetricCipherVariablesSerializer()
            .load(StreamQueue(Stream.fromIterable(key)));

    if (forDecryption) {
      try {
        final byteInput = DechunkedStreamQueue(input);
        final encryptedSymmetricKey = serializer.load(byteInput);
        final symmetricKeyChunks = await asymmetric
            .decrypt(
                StreamQueue(
                    Stream.fromFuture(Future.value(encryptedSymmetricKey))),
                asymmetricVariables)
            .toList();
        final symmetricNonce = await serializer.load(byteInput);
        yield* symmetric.decrypt(
            StreamQueue(byteInput.restChunks),
            CipherVariables(
                key: _flattenChunks(symmetricKeyChunks),
                nonce: symmetricNonce));
      } catch (e) {
        throw Exception("There was an error upon decryption");
      }
    } else {
      final symmetricKey = await symmetric.newKey;
      final encryptedSymmetricKeyChunks = await asymmetric
          .encrypt(StreamQueue(Stream.fromFuture(Future.value(symmetricKey))),
              asymmetricVariables)
          .toList();

      yield Bytes.fromList(await serializer
          .serialize(_flattenChunks(encryptedSymmetricKeyChunks))
          .toList());

      final symmetricNonce = await symmetric.newNonce;
      yield Bytes.fromList(await serializer.serialize(symmetricNonce).toList());

      yield* symmetric.encrypt(
          input, CipherVariables(key: symmetricKey, nonce: symmetricNonce));
    }
  }
}

Bytes _flattenChunks(List<Bytes> input) {
  final result = List<int>.empty(growable: true);
  for (final chunk in input) {
    result.addAll(chunk);
  }
  return Bytes.fromList(result);
}
