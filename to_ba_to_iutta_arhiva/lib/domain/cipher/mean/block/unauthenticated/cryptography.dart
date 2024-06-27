part of "../../../index.dart";

class _CryptographyUnauthenticatedBlockCipher extends UnauthenticatedBlockCipher
    with _CryptographyCipher, _CryptographyBlockCipher {
  @override
  late final c.Cipher algorithm;

  _CryptographyUnauthenticatedBlockCipher(super.params) : super.constructor() {
    if (params.engine != BlockCipherEngine.aes) {
      throw UnsupportedError(
          "Cryptography library doesn't support a different engine than AES");
    }

    const authenticator = c.MacAlgorithm.empty;

    switch (params.moo) {
      case UnauthenticatedModeOfOperation.cbc:
        algorithm = c.AesCbc.with128bits(macAlgorithm: authenticator);
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different unauthenticated MOO than CBC");
    }
  }

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    final authenticatorVariablesStream = StreamController<Bytes>();
    final authenticatorProcessor = await serializeAuthenticatorVariables(
        authenticatorVariablesStream, variables);
    authenticatorVariablesStream.close();
    yield* authenticatorVariablesStream.stream;

    final ciphertextStream = algorithm.encryptStream(input.rest,
        secretKey: c.SecretKey(variables.key),
        nonce: variables.nonce,
        onMac: (value) {});

    Bytes chunk;
    await for (List<int> listChunk in ciphertextStream) {
      chunk = Bytes.fromList(listChunk);
      authenticatorProcessor.put(chunk);
      yield chunk;
    }

    yield await authenticatorProcessor.result;
  }

  @override
  Stream<Bytes> decrypt(StreamQueue<Bytes> input, CipherVariables variables) =>
      decryptWithMac(
          input,
          variables,
          (input2, variables2) => algorithm
              .decryptStream(input2.rest,
                  secretKey: c.SecretKey(variables2.key),
                  nonce: variables.nonce,
                  mac: c.Mac.empty)
              .transform(StreamTransformer.fromHandlers(
                  handleData: (data, sink) => sink.add(Bytes.fromList(data)))));
}
