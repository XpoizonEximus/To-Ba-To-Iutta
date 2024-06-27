part of "../index.dart";

class KdfParams extends Params {
  final int nonceSize;

  const KdfParams(this.nonceSize);
  KdfParams.fromParams(KdfParams params) : this(params.nonceSize);

  @override
  KdfParamsImplementation get implementation => KdfParamsImplementation.base;
}

class KdfParamsInteractorConverter
    extends ParamsInteractorConverter<KdfParams, KdfParamsInteractor> {
  const KdfParamsInteractorConverter();

  @override
  KdfParamsInteractor convert(KdfParams params, {Key? key}) =>
      KdfParamsInteractor(
          key: key, initial: params);
}
