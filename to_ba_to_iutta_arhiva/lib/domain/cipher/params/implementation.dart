part of "../index.dart";

class CipherParamsImplementation
    extends ParamsImplementation<CipherParams, CipherParamsInteractor> {
  static final values = [base, block];
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
      BlockCipherParams(
          BlockCipherEngine.aes, base.defaults));

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

  const CipherParamsImplementation(
      CipherParamsImplementation? super.underlying,
      CipherParamsInteractorConverter super.converter,
      CipherParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
