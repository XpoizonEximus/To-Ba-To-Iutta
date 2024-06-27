part of "../../../index.dart";

class _CryptographyUnauthenticatedBlockCipher extends UnauthenticatedBlockCipher
    with _CryptographyCipher, _CryptographyBlockCipher {
  @override
  late final c.Cipher algorithm;

  _CryptographyUnauthenticatedBlockCipher(super.params) : super.constructor() {
    if (params.engine != BlockCipherEngine.aes) {
      throw UnsupportedError(
          "Cryptography library doesn't support a different engine than AES for unauthenticated block encryption");
    }

    const authenticator = c.MacAlgorithm.empty;

    switch (params.moo) {
      case UnauthenticatedModeOfOperation.cbc:
        algorithm = c.AesCbc.with128bits(macAlgorithm: authenticator);
        break;
      case UnauthenticatedModeOfOperation.ctr:
        algorithm = c.AesCtr.with128bits(macAlgorithm: authenticator);
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different unauthenticated MOO than CBC and CTR");
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
