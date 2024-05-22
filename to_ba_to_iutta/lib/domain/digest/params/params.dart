part of "../index.dart";

class DigestParams extends Params {
  const DigestParams();

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
          key: key, initial: params, title: params.implementation.name);
}
