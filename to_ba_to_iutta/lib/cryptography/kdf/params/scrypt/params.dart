part of "../../index.dart";

class ScryptKdfParams extends KdfParams {
  final int costFactorExponent;
  final int blockSizeFactor;
  final int parallelisationFactor;

  ScryptKdfParams(super.underlying,
      {required this.costFactorExponent,
      required this.blockSizeFactor,
      required this.parallelisationFactor})
      : super.fromParams();
      
  ScryptKdfParams.fromParams(ScryptKdfParams params)
      : this(params,
            costFactorExponent: params.costFactorExponent,
            blockSizeFactor: params.blockSizeFactor,
            parallelisationFactor: params.parallelisationFactor);

  @override
  KdfParamsImplementation get implementation => KdfParamsImplementation.scrypt;
}

class ScryptKdfParamsInteractorConverter extends KdfParamsInteractorConverter {
  const ScryptKdfParamsInteractorConverter();

  @override
  ScryptKdfParamsInteractor convert(covariant ScryptKdfParams params,
          {Key? key}) =>
      ScryptKdfParamsInteractor(
        key: key,
        initial: params,
      );
}
