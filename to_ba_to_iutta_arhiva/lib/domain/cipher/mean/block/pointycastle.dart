part of "../../index.dart";

mixin _PointyCastleBlockCipher on _PointyCastleCipher, BlockCipher {
  abstract final pc.BlockCipher algorithm;

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(true,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));
    final chunks = StreamQueue(blockifiedInput(input));

    if (!await input.hasNext) return;

    Bytes chunk;
    for (chunk = await chunks.next;
        await chunks.hasNext;
        chunk = await chunks.next) {
      yield algorithm.process(chunk);
    }

    final padLength = blockSize - (chunk.length % blockSize);
    final paddedChunk = Bytes(chunk.length + padLength)..setAll(0, chunk);
    pkcs7.PKCS7Padding().addPadding(paddedChunk, chunk.length);

    yield algorithm.process(paddedChunk);
  }

  @override
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(false,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));
    final chunks = StreamQueue(blockifiedInput(input));

    if (!await chunks.hasNext) return;

    Bytes chunk;
    for (chunk = await chunks.next;
        await chunks.hasNext;
        chunk = await chunks.next) {
      yield algorithm.process(chunk);
    }

    if (chunk.length != blockSize) {
      throw ArgumentError("Invalid input length");
    }

    final paddedChunk = algorithm.process(chunk);
    yield paddedChunk.sublist(
        0, paddedChunk.length - pkcs7.PKCS7Padding().padCount(paddedChunk));
  }

  @override
  int get nonceSize => algorithm.blockSize;
  @override
  int get keySize => algorithm.blockSize;
  @override
  int get blockSize => algorithm.blockSize;

  @override
  Future<Bytes> get newKey => SecureBytesGenerator(keySize).get;
  @override
  Future<Bytes> get newNonce => SecureBytesGenerator(nonceSize).get;
}
