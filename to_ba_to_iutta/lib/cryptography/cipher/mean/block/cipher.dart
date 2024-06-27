part of "../../index.dart";

abstract class BlockCipher extends Cipher {
  int get blockSize;

  BlockCipher(BlockCipherParams super.params);

  Stream<Bytes> blockifiedInput(StreamQueue<Bytes> input) async* {
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
