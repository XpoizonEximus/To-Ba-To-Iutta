part of "../../index.dart";

class FixedLengthKeyAuthenticatorParams extends AuthenticatorParams {
  final KdfData kdfData;

  const FixedLengthKeyAuthenticatorParams(super.underlying, this.kdfData)
      : super.fromParams();
  FixedLengthKeyAuthenticatorParams.fromParams(
      FixedLengthKeyAuthenticatorParams params)
      : this(params, params.kdfData);

  @override
  AuthenticatorParamsImplementation get implementation =>
      AuthenticatorParamsImplementation.fixedLengthKey;
}

class FixedLengthKeyAuthenticatorParamsInteractorConverter
    extends AuthenticatorParamsInteractorConverter {
  const FixedLengthKeyAuthenticatorParamsInteractorConverter();

  @override
  FixedLengthKeyAuthenticatorParamsInteractor convert(
          covariant FixedLengthKeyAuthenticatorParams params,
          {Key? key}) =>
      FixedLengthKeyAuthenticatorParamsInteractor(key: key, initial: params);
}
