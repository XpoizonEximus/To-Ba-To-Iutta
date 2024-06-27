part of "../../../index.dart";

class _PointyCastleUnauthenticatedBlockCipher extends UnauthenticatedBlockCipher
    with _PointyCastleCipher, _PointyCastleBlockCipher {
  @override
  late final pc.BlockCipher algorithm;

  _PointyCastleUnauthenticatedBlockCipher(super.params) : super.constructor() {
    late final pc.BlockCipher engine;
    switch (params.engine) {
      case BlockCipherEngine.aes:
        engine = aes.AESEngine();
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different engine than AES for unauthenticated block encryption");
    }

    switch (params.moo) {
      case UnauthenticatedModeOfOperation.cbc:
        algorithm = cbc.CBCBlockCipher(engine);
        nonceSize = blockSize;
        break;

      case UnauthenticatedModeOfOperation.cfb64:
        algorithm = cfb.CFBBlockCipher(engine, 16);
        nonceSize = blockSize;
        break;

      case UnauthenticatedModeOfOperation.ofb64:
        algorithm = ofb.OFBBlockCipher(engine, 16);
        nonceSize = blockSize;
        break;

      case UnauthenticatedModeOfOperation.ige:
        algorithm = ige.IGEBlockCipher(engine);
        nonceSize = blockSize * 2;
        break;

      default:
        throw UnsupportedError(
            "Pointy Castle library doesn't support a different unauthenticated MOO than CBC, cfb64, ofb64, ige");
    }
  }

  @override
  late final int nonceSize;

  @override
  Stream<Bytes> simpleEncrypt(
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
  Stream<Bytes> simpleDecrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(false,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));
    final chunks = input;

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
}
