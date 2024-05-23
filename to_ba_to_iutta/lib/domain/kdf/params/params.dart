part of "../index.dart";

class KdfParams extends Params {
  const KdfParams();

  @override
  KdfParamsImplementation get implementation =>
      KdfParamsImplementation.base;
}

class KdfParamsInteractorConverter extends ParamsInteractorConverter<
    KdfParams, KdfParamsInteractor> {
  const KdfParamsInteractorConverter();

  @override
  KdfParamsInteractor convert(KdfParams params,
          {Key? key}) =>
      KdfParamsInteractor(
          key: key, initial: params, title: params.implementation.name);
}
