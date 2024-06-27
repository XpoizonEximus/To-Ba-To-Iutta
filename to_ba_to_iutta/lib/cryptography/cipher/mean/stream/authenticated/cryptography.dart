part of "../../../index.dart";

class _CryptographyAuthenticatedStreamCipher extends AuthenticatedStreamCipher
    with _CryptographyCipher, _CryptographyStreamCipher {
  @override
  late final c.Cipher algorithm;

  _CryptographyAuthenticatedStreamCipher(super.params) : super.constructor() {
    switch (params.engine) {
      case AuthenticatedStreamEngine.chacha20:
        algorithm = c.Chacha20.poly1305Aead();
        break;
      case AuthenticatedStreamEngine.xchacha20:
        algorithm = c.Xchacha20.poly1305Aead();
        break;
      default:
        throw UnsupportedError(
            "Cryptography library doesn't support a different authenticated stream engine than ChaCha20 or XChaCha20");
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
