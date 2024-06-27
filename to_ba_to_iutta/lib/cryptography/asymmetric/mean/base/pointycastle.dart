part of "../../index.dart";

abstract class _PointyCastleAsymmetricCipher extends AsymmetricCipher {
  abstract final pc.AsymmetricBlockCipher algorithm;

  _PointyCastleAsymmetricCipher(super.params);

  pc.PrivateKeyParameter privateKey(AsymmetricCipherVariables variables);
  pc.PublicKeyParameter publicKey(AsymmetricCipherVariables variables);

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, AsymmetricCipherVariables variables) async* {
        final public = publicKey(variables);
    algorithm.init(true, public);

    await for (final chunk
        in blockifiedInput(input, algorithm.inputBlockSize)) {
      yield algorithm.process(chunk);
    }
  }

  @override
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, AsymmetricCipherVariables variables) async* {
    algorithm.init(false, privateKey(variables));

    await for (final chunk
        in blockifiedInput(input, algorithm.inputBlockSize)) {
      yield algorithm.process(chunk);
    }
  }

  Stream<Bytes> blockifiedInput(
      StreamQueue<Bytes> input, int blockSize) async* {
    if (blockSize <= 0) {
      throw StateError("A cipher must have a positive, not null block size.");
    }
    if (!await input.hasNext) return;

    var buffer = Bytes(0);
    await for (final chunk in input.rest) {
      var newBuffer = Bytes(buffer.length + chunk.length);
      newBuffer.setRange(0, buffer.length, buffer);
      newBuffer.setRange(buffer.length, newBuffer.length, chunk);
      buffer = newBuffer;

      while (buffer.length > blockSize) {
        yield buffer.sublist(0, blockSize);
        buffer = buffer.sublist(blockSize);
      }
    }

    if (buffer.isNotEmpty) yield buffer;
  }
}
