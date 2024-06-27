part of "../../../index.dart";

class _CryptographyUnauthenticatedStreamCipher
    extends UnauthenticatedStreamCipher
    with _CryptographyCipher, _CryptographyStreamCipher {
  @override
  late final c.Cipher algorithm;

  _CryptographyUnauthenticatedStreamCipher(super.params) : super.constructor() {
    if (params.rounds != 20) {
      throw UnsupportedError(
          "Cryptography library doesn't support a different number of rounds other than 20 for stream ciphers");
    }

    const authenticator = c.MacAlgorithm.empty;

    switch (params.engine) {
      case UnauthenticatedStreamEngine.chacha20:
        algorithm = c.Chacha20(macAlgorithm: authenticator);
        break;
      case UnauthenticatedStreamEngine.xchacha20:
        algorithm = c.Xchacha20(macAlgorithm: authenticator);
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different unauthenticated stream engine than ${UnauthenticatedStreamEngine.chacha20.name} and ${UnauthenticatedStreamEngine.xchacha20.name}");
    }
  }

  @override
  Stream<Bytes> simpleEncrypt(
          StreamQueue<Bytes> input, CipherVariables variables) =>
      algorithm
          .encryptStream(input.rest,
              secretKey: c.SecretKey(variables.key),
              nonce: variables.nonce,
              onMac: (value) {})
          .transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(Bytes.fromList(data)),
          ));

  @override
  Stream<Bytes> simpleDecrypt(
          StreamQueue<Bytes> input, CipherVariables variables) =>
      algorithm
          .decryptStream(input.rest,
              secretKey: c.SecretKey(variables.key),
              nonce: variables.nonce,
              mac: c.Mac.empty)
          .transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(Bytes.fromList(data)),
          ));
}
