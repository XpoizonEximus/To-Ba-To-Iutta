part of "../index.dart";

class CipherParamsImplementation
    extends ParamsImplementation<CipherParams, CipherParamsInteractor> {
  static final values = [
    base,
    block,
    unauthenticatedBlock,
    authenticatedBlock,
    stream,
    unauthenticatedStream,
    authenticatedStream
  ];
  static const base = CipherParamsImplementation(
      null,
      CipherParamsInteractorConverter(),
      CipherParamsSerializer(),
      "Cipher params",
      CipherParams());

  static final block = CipherParamsImplementation(
      base,
      const BlockCipherParamsInteractorConverter(),
      const BlockCipherParamsSerializer(),
      "Block cipher params",
      BlockCipherParams(BlockCipherEngine.aes, base.defaults));

  static final authenticatedBlock = CipherParamsImplementation(
      block,
      const AuthenticatedBlockCipherParamsInteractorConverter(),
      const AuthenticatedBlockCipherParamsSerializer(),
      "Block cipher params",
      AuthenticatedBlockCipherParams(AuthenticatedModeOfOperation.gcm,
          block.defaults as BlockCipherParams));

  static final unauthenticatedBlock = CipherParamsImplementation(
      block,
      const UnauthenticatedBlockCipherParamsInteractorConverter(),
      UnauthenticatedBlockCipherParamsSerializer(),
      "Block cipher params",
      UnauthenticatedBlockCipherParams(
          AuthenticatorData.defaults,
          UnauthenticatedModeOfOperation.cbc,
          block.defaults as BlockCipherParams));

  static final stream = CipherParamsImplementation(
      base,
      const StreamCipherParamsInteractorConverter(),
      const StreamCipherParamsSerializer(),
      "Stream cipher params",
      StreamCipherParams(base.defaults));

  static final authenticatedStream = CipherParamsImplementation(
      stream,
      const AuthenticatedStreamCipherParamsInteractorConverter(),
      const AuthenticatedStreamCipherParamsSerializer(),
      "Stream cipher params",
      AuthenticatedStreamCipherParams(AuthenticatedStreamEngine.xchacha20,
          stream.defaults as StreamCipherParams));

  static final unauthenticatedStream = CipherParamsImplementation(
      stream,
      const UnauthenticatedStreamCipherParamsInteractorConverter(),
      UnauthenticatedStreamCipherParamsSerializer(),
      "Stream cipher params",
      UnauthenticatedStreamCipherParams(
          AuthenticatorData(AuthenticatorImplementation.poly1305,
              AuthenticatorImplementation.poly1305.requiredParams.defaults),
          UnauthenticatedStreamEngine.xchacha20,
          20,
          stream.defaults as StreamCipherParams));

  const CipherParamsImplementation(
      CipherParamsImplementation? super.underlying,
      CipherParamsInteractorConverter super.converter,
      CipherParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
