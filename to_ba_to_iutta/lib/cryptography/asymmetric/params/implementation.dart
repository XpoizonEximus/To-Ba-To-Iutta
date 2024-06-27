part of "../index.dart";

class AsymmetricCipherParamsImplementation extends ParamsImplementation<
    AsymmetricCipherParams, AsymmetricCipherParamsInteractor> {
  static final values = [base];
  static const AsymmetricCipherParamsImplementation base =
      AsymmetricCipherParamsImplementation(
          null,
          AsymmetricCipherParamsInteractorConverter(),
          AsymmetricCipherParamsSerializer(),
          "AsymmetricCipher params",
          AsymmetricCipherParams(
              AsymmetricCipherEngine.rsa, AsymmetricEncoding.oaep));

  const AsymmetricCipherParamsImplementation(
      AsymmetricCipherParamsImplementation? super.underlying,
      AsymmetricCipherParamsInteractorConverter super.converter,
      AsymmetricCipherParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
