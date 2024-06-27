part of "../index.dart";

class ScryptKdf extends _PointyCastleKdf {
  final ScryptKdfParams _params;
  ScryptKdf(this._params) : super(_params);

  @override
  KdfData get data => KdfData(KdfImplementation.scrypt, _params);

  static int _calcPow(int exp) {
    if (exp < 1) {
      return 1;
    }
    return 2 * _calcPow(exp - 1);
  }

  @override
  scrypt.Scrypt algorithm(KdfVariables variables) => scrypt.Scrypt()
    ..init(pckdf.ScryptParameters(
        _calcPow(_params.costFactorExponent),
        _params.blockSizeFactor,
        _params.parallelisationFactor,
        variables.size,
        variables.nonce));
}

class ScryptKdfImplementationConverter extends KdfImplementationConverter {
  const ScryptKdfImplementationConverter();

  @override
  ScryptKdf convert(covariant ScryptKdfParams params) => ScryptKdf(params);
}
