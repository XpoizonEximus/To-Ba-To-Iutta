part of "../../../index.dart";

class _CryptographyAuthenticatedBlockCipher extends AuthenticatedBlockCipher
    with _CryptographyCipher, _CryptographyBlockCipher {
  @override
  late final c.Cipher algorithm;

  _CryptographyAuthenticatedBlockCipher(super.params) : super.constructor() {
    if (params.engine != BlockCipherEngine.aes) {
      throw UnsupportedError(
          "Cryptography library doesn't support a different engine than AES for Authenticated block encryption");
    }

    switch (params.moo) {
      case AuthenticatedModeOfOperation.gcm:
        algorithm = c.AesGcm.with128bits();
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different authenticated MOO than GCM");
    }
  }

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    late Bytes mac;
    yield* algorithm.encryptStream(input.rest,
        secretKey: c.SecretKey(variables.key),
        nonce: variables.nonce, onMac: (value) {
      mac = Bytes.fromList(value.bytes);
    }).transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) => sink.add(Bytes.fromList(data)),
    ));
    yield mac;
  }

  @override
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    final mac = Bytes(macSize);

    final controlledInput = StreamController<Bytes>();
    Future future = Future.delayed(Duration.zero);
    future = controlledInput.addStream(extractMac(input, (value) {
      for (int i = 0; i < value.length; ++i) {
        mac[i] = value[i];
      }
      () async {
        await future;
        controlledInput.close();
      }();
    }));

    yield* algorithm
        .decryptStream(controlledInput.stream,
            secretKey: c.SecretKey(variables.key),
            nonce: variables.nonce,
            mac: c.Mac(mac))
        .transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(Bytes.fromList(data)),
        ));
  }

  @override
  int get macSize => algorithm.macAlgorithm.macLength;
}
