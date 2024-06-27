part of "../../index.dart";

abstract class BlockCipher extends Cipher {
  int get blockSize;

  @override
  int get keySize => blockSize;

  BlockCipher(BlockCipherParams super.params);

  Stream<Bytes> blockifiedInput(StreamQueue<Bytes> input) async* {
    if (!await input.hasNext) return;

    final buffer = Queue<int>();

    Bytes chunk;
    for (chunk = await input.next;
        await input.hasNext;
        chunk = await input.next) {
      buffer.addAll(chunk);

      while (buffer.length >= blockSize) {
        final res = Bytes(blockSize);
        for (int i = 0; i < blockSize; ++i) {
          res[i] = buffer.removeFirst();
        }
        yield res;
      }
    } 

    buffer.addAll(chunk);

    while (buffer.length >= blockSize) {
      final res = Bytes(blockSize);
      for (int i = 0; i < blockSize; ++i) {
        res[i] = buffer.removeFirst();
      }
      yield res;
    }

    if (buffer.isNotEmpty) {
      yield Bytes.fromList(buffer.toList());
    }
  }
}
