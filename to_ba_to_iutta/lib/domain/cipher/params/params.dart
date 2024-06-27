part of "../index.dart";

class CipherParams extends Params {
  const CipherParams();
  CipherParams.fromParams(CipherParams params) : this();

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.base;
}

class CipherParamsInteractorConverter
    extends ParamsInteractorConverter<CipherParams, CipherParamsInteractor> {
  const CipherParamsInteractorConverter();

  @override
  CipherParamsInteractor convert(CipherParams params, {Key? key}) =>
      CipherParamsInteractor(
          key: key, initial: params);
}
