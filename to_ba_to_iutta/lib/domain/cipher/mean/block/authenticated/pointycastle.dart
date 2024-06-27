part of "../../../index.dart";

class _PointyCastleAuthenticatedBlockCipher extends AuthenticatedBlockCipher
    with _PointyCastleCipher, _PointyCastleBlockCipher {
  @override
  late final pc.AEADBlockCipher algorithm;

  _PointyCastleAuthenticatedBlockCipher(super.params) : super.constructor() {
    late final pc.BlockCipher engine;
    switch (params.engine) {
      case BlockCipherEngine.aes:
        engine = aes.AESEngine();
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different engine than AES for Authenticated block encryption");
    }

    switch (params.moo) {
      case AuthenticatedModeOfOperation.ccm:
        algorithm = ccm.CCMBlockCipher(engine);
        nonceSize = 12;
        macSize = 8;
        _getOutputSize = (algorithm as ccm.CCMBlockCipher).getOutputSize;
        break;

      case AuthenticatedModeOfOperation.gcm:
        algorithm = gcm.GCMBlockCipher(engine);
        nonceSize = blockSize;
        macSize = (algorithm as gcm.GCMBlockCipher).macSize;
        _getOutputSize = (algorithm as gcm.GCMBlockCipher).getOutputSize;
        break;

      default:
        throw UnsupportedError(
            "Pointy Castle library doesn't support a different authenticated MOO than GCM or CCM");
    }
  }

  @override
  late final int nonceSize;

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(true,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));
    await for (final chunk in input.rest) {
      final output = Bytes(_getOutputSize(chunk.length));
      final count = algorithm.processBytes(chunk, 0, chunk.length, output, 0);
      if (count != 0) yield output.sublist(0, count);
    }
    final output = Bytes(_getOutputSize(0));
    algorithm.doFinal(output, 0);
    yield output;
  }

  @override
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(false,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));
    await for (final chunk in input.rest) {
      final output = Bytes(_getOutputSize(chunk.length));
      final count = algorithm.processBytes(chunk, 0, chunk.length, output, 0);
      if (count != 0) yield output.sublist(0, count);
    }
    final output = Bytes(_getOutputSize(0));
    algorithm.doFinal(output, 0);
    yield output;
  }

  @override
  late final int macSize;

  late final int Function(int) _getOutputSize;
}
