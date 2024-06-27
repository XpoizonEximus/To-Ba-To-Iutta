part of "../../../index.dart";

class _PointyCastleUnauthenticatedStreamCipher
    extends UnauthenticatedStreamCipher
    with _PointyCastleCipher, _PointyCastleStreamCipher {
  @override
  late final pc.StreamCipher algorithm;

  _PointyCastleUnauthenticatedStreamCipher(super.params) : super.constructor() {
    switch (params.engine) {
      case UnauthenticatedStreamEngine.chacha20:
        algorithm = chacha20.ChaCha20Engine.fromRounds(params.rounds);
        keySize = 32;
        nonceSize = 8;
        break;
      case UnauthenticatedStreamEngine.chacha7539:
        algorithm = chacha7539.ChaCha7539Engine.fromRounds(params.rounds);
        keySize = 32;
        nonceSize = 12;
        break;
      case UnauthenticatedStreamEngine.salsa20:
        if (params.rounds != 20) {
          throw ArgumentError(
              "Cryptography library doesn't support a differnet number of rounds other than 20 for ${UnauthenticatedStreamEngine.salsa20.name}");
        }
        algorithm = salsa20.Salsa20Engine();
        keySize = 32;
        nonceSize = 8;
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different engine other than ${UnauthenticatedStreamEngine.chacha20.name}, ${UnauthenticatedStreamEngine.chacha7539.name} adn ${UnauthenticatedStreamEngine.salsa20.name} for unauthenticated stream encryption");
    }
  }

  @override
  late final int nonceSize;

  @override
  Stream<Bytes> simpleEncrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(true,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));

    await for (final chunk in input.rest) {
      yield algorithm.process(chunk);
    }
  }

  @override
  Stream<Bytes> simpleDecrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    algorithm.init(false,
        pc.ParametersWithIV(pc.KeyParameter(variables.key), variables.nonce));

    await for (final chunk in input.rest) {
      yield algorithm.process(chunk);
    }
  }

  @override
  late final int keySize;
}
