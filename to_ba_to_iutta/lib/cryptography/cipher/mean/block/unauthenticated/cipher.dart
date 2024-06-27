part of "../../../index.dart";

abstract class UnauthenticatedBlockCipher extends BlockCipher {
  final UnauthenticatedBlockCipherParams params;

  UnauthenticatedBlockCipher.constructor(this.params) : super(params);

  factory UnauthenticatedBlockCipher(UnauthenticatedBlockCipherParams params) {
    switch (params.moo) {
      case UnauthenticatedModeOfOperation.cbc:
        return _CryptographyUnauthenticatedBlockCipher(params);
      case UnauthenticatedModeOfOperation.ctr:
        return _CryptographyUnauthenticatedBlockCipher(params);
      case UnauthenticatedModeOfOperation.cfb64:
        return _PointyCastleUnauthenticatedBlockCipher(params);
      case UnauthenticatedModeOfOperation.ofb64:
        return _PointyCastleUnauthenticatedBlockCipher(params);
      case UnauthenticatedModeOfOperation.ige:
        return _PointyCastleUnauthenticatedBlockCipher(params);
    }
  }

  @override
  CipherData get data =>
      CipherData(CipherImplementation.unauthenticatedBlock, params);

  @override
  int get macSize => params.authenticatorData.newMean.outputSize;

  Future<AuthenticatorProcessor> serializeAuthenticatorVariables(
      StreamController<Bytes> streamController,
      CipherVariables variables) async {
    const bytesSerializer = BytesSerializer();

    final authenticator = params.authenticatorData.newMean;

    var authenticatorKey = variables.key;
    if (authenticator.keySize != authenticatorKey.length) {
      final kdf = authenticator.kdf;

      final kdfNonce = await kdf.newNonce;
      streamController.add(
          Bytes.fromList(await bytesSerializer.serialize(kdfNonce).toList()));

      final kdfVariables =
          KdfVariables(size: authenticator.keySize, nonce: kdfNonce);
      authenticatorKey = await kdf.process(authenticatorKey, kdfVariables);
    }

    final authenticatorNonce = await authenticator.newNonce;
    streamController.add(Bytes.fromList(
        await bytesSerializer.serialize(authenticatorNonce).toList()));
    final authenticatorVariables = AuthenticatorVariables(
        key: authenticatorKey, nonce: authenticatorNonce);

    return authenticator.newProcessor(authenticatorVariables,
        syncronized: false);
  }

  Future<AuthenticatorProcessor> loadAuthenticatorVariables(
      StreamQueue<Byte> input, CipherVariables variables) async {
    const bytesSerializer = BytesSerializer();

    final authenticator = params.authenticatorData.newMean;

    var authenticatorKey = variables.key;
    if (authenticator.keySize != authenticatorKey.length) {
      final kdf = authenticator.kdf;

      final kdfNonce = await bytesSerializer.load(input);

      final kdfVariables =
          KdfVariables(size: authenticator.keySize, nonce: kdfNonce);
      authenticatorKey = await kdf.process(authenticatorKey, kdfVariables);
    }

    final authenticatorNonce = await bytesSerializer.load(input);
    final authenticatorVariables = AuthenticatorVariables(
        key: authenticatorKey, nonce: authenticatorNonce);

    return authenticator.newProcessor(authenticatorVariables,
        syncronized: false);
  }

  @override
  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    final authenticatorVariablesStream = StreamController<Bytes>();
    final authenticatorProcessor = await serializeAuthenticatorVariables(
        authenticatorVariablesStream, variables);
    authenticatorVariablesStream.close();
    yield* authenticatorVariablesStream.stream;

    final ciphertextStream = simpleEncrypt(input, variables);

    Bytes chunk;
    await for (List<int> listChunk in ciphertextStream) {
      chunk = Bytes.fromList(listChunk);
      authenticatorProcessor.put(chunk);
      yield chunk;
    }

    yield await authenticatorProcessor.result;
  }

  Stream<Bytes> simpleEncrypt(
      StreamQueue<Bytes> input, CipherVariables variables);

  @override
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, CipherVariables variables) async* {
    final dechunkedInput = DechunkedStreamQueue(input);
    final authenticatorProcessor =
        await loadAuthenticatorVariables(dechunkedInput, variables);

    late final Bytes shippedMac;
    final cipherTextStream = blockifiedInput(
        StreamQueue(extractMac(StreamQueue(dechunkedInput.restChunks), (value) {
      shippedMac = value;
    })));

    yield* simpleDecrypt(
        StreamQueue(cipherTextStream.transform(StreamTransformer.fromHandlers(
      handleData: (chunk, sink) {
        authenticatorProcessor.put(chunk);
        sink.add(chunk);
      },
    ))), variables);

    final processedMac = await authenticatorProcessor.result;

    if (processedMac.length != shippedMac.length) {
      throw ArgumentError("Invalid input.");
    }
    for (int i = 0; i < processedMac.length; ++i) {
      if (processedMac[i] != shippedMac[i]) {
        throw ArgumentError("Authentication failed");
      }
    }
  }

  Stream<Bytes> simpleDecrypt(
      StreamQueue<Bytes> input, CipherVariables variables);
}

class UnauthenticatedBlockCipherImplementationConverter
    extends CipherImplementationConverter {
  const UnauthenticatedBlockCipherImplementationConverter();
  @override
  Cipher convert(covariant UnauthenticatedBlockCipherParams params) =>
      UnauthenticatedBlockCipher(params);
}
