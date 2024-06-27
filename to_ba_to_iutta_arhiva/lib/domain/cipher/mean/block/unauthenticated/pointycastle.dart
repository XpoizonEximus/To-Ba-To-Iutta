part of "../../../index.dart";

class _PointyCastleUnauthenticatedBlockCipher extends UnauthenticatedBlockCipher
    with _PointyCastleCipher, _PointyCastleBlockCipher {
  @override
  late final pc.BlockCipher algorithm;

  _PointyCastleUnauthenticatedBlockCipher(super.params) : super.constructor() {
    final engine =
        switch (params.engine) { BlockCipherEngine.aes => aes.AESEngine() };

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
    }
  }

  @override
  late final int nonceSize;

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    final authenticatorVariablesStream = StreamController<Bytes>();
    final authenticatorProcessor = await serializeAuthenticatorVariables(
        authenticatorVariablesStream, variables);
    authenticatorVariablesStream.close();
    yield* authenticatorVariablesStream.stream;

    await for (final encryptedChunk in super.encrypt(input, variables)) {
      authenticatorProcessor.put(encryptedChunk);
      yield encryptedChunk;
    }

    yield await authenticatorProcessor.result;
  }

  @override
  Stream<Bytes> decrypt(StreamQueue<Bytes> input, CipherVariables variables) =>
      decryptWithMac(input, variables,
          (input2, variables2) => super.decrypt(input2, variables2));
}
