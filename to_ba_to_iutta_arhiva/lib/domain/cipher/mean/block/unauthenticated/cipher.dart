part of "../../../index.dart";

abstract class UnauthenticatedBlockCipher extends BlockCipher {
  final UnauthenticatedBlockCipherParams params;

  UnauthenticatedBlockCipher.constructor(this.params) : super(params);

  factory UnauthenticatedBlockCipher(UnauthenticatedBlockCipherParams params) {
    switch (params.moo) {
      case UnauthenticatedModeOfOperation.cbc:
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

  Stream<Bytes> decryptWithMac(
      StreamQueue<Bytes> input,
      CipherVariables variables,
      Stream<Bytes> Function(
              StreamQueue<Bytes> input, CipherVariables variables)
          decryptWithoutMac) async* {
    final byteInput = DechunkedStreamQueue(input);
    final authenticatorProcessor =
        await loadAuthenticatorVariables(byteInput, variables);

    final sender = StreamController<Bytes>();
    final receiver =
        StreamQueue(decryptWithoutMac(StreamQueue(sender.stream), variables));

    final finalInput = StreamQueue(byteInput.restChunks);

    final macQueue = Queue<Byte>();
    final macSize = params.authenticatorData.newMean.outputSize;

    while (macQueue.length <= macSize) {
      if (!await finalInput.hasNext) {
        throw ArgumentError("Invalid input length");
      }
      macQueue.addAll(await finalInput.next);
    }

    bool bytesArrived = false;

    while (await finalInput.hasNext) {
      receiver.hasNext.whenComplete(() {
        bytesArrived = true;
      });

      if (!bytesArrived) {
        if (macQueue.length > macSize) {
          final n = macQueue.length - macSize;
          final toAdd = Bytes(n);
          for (int i = 0; i < n; ++i) {
            toAdd[i] = macQueue.removeFirst();
          }

          sender.add(toAdd);
          authenticatorProcessor.put(toAdd);
        } else {
          macQueue.addAll(await finalInput.next);
        }
      } else {
        yield await receiver.next;
      }

      await Future.delayed(Duration.zero);
    }

    if (macQueue.length > macSize) {
      final n = macQueue.length - macSize;
      final toAdd = Bytes(n);
      for (int i = 0; i < n; ++i) {
        toAdd[i] = macQueue.removeFirst();
      }

      sender.add(toAdd);
      authenticatorProcessor.put(toAdd);
    }
    
    sender.close();
    while (await receiver.hasNext) {
      yield await receiver.next;
    }

    final expectedMac = await authenticatorProcessor.result;
    final actualMac = macQueue.toList();

    if (expectedMac.length != actualMac.length) {
      throw ArgumentError("Invalid input.");
    }

    for (int i = 0; i < expectedMac.length; ++i) {
      if (expectedMac[i] != actualMac[i]) {
        throw ArgumentError("Authentication failed");
      }
    }
  }
}

class UnauthenticatedBlockCipherImplementationConverter
    extends CipherImplementationConverter {
  const UnauthenticatedBlockCipherImplementationConverter();
  @override
  Cipher convert(covariant UnauthenticatedBlockCipherParams params) =>
      UnauthenticatedBlockCipher(params);
}
