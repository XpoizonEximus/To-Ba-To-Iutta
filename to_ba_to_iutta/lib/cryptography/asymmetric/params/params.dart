part of "../index.dart";

enum AsymmetricCipherEngine implements Named {
  rsa("RSA");

  @override
  final String name;

  const AsymmetricCipherEngine(this.name);
}

enum AsymmetricEncoding implements Named {
  pkcs1("PKCS1"),
  oaep("OAEP");

  @override
  final String name;

  const AsymmetricEncoding(this.name);
}

class AsymmetricCipherParams extends Params {
  final AsymmetricCipherEngine engine;
  final AsymmetricEncoding encoding;

  const AsymmetricCipherParams(this.engine, this.encoding);
  AsymmetricCipherParams.fromParams(AsymmetricCipherParams params)
      : this(params.engine, params.encoding);

  @override
  AsymmetricCipherParamsImplementation get implementation =>
      AsymmetricCipherParamsImplementation.base;
}

class AsymmetricCipherParamsInteractorConverter
    extends ParamsInteractorConverter<AsymmetricCipherParams,
        AsymmetricCipherParamsInteractor> {
  const AsymmetricCipherParamsInteractorConverter();

  @override
  AsymmetricCipherParamsInteractor convert(AsymmetricCipherParams params,
          {Key? key}) =>
      AsymmetricCipherParamsInteractor(key: key, initial: params);
}
