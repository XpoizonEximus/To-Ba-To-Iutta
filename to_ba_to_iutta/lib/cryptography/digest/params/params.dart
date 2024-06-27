part of "../index.dart";

class DigestParams extends Params {
  const DigestParams();
  const DigestParams.fromParams(DigestParams params) : this();

  @override
  DigestParamsImplementation get implementation =>
      DigestParamsImplementation.base;
}

class DigestParamsInteractorConverter
    extends ParamsInteractorConverter<DigestParams, DigestParamsInteractor> {
  const DigestParamsInteractorConverter();

  @override
  DigestParamsInteractor convert(DigestParams params, {Key? key}) =>
      DigestParamsInteractor(
          key: key, initial: params);
}
