part of "../index.dart";

class AuthenticatorParams extends Params {
  const AuthenticatorParams();
  const AuthenticatorParams.fromParams(AuthenticatorParams params) : this();

  @override
  AuthenticatorParamsImplementation get implementation =>
      AuthenticatorParamsImplementation.base;
}

class AuthenticatorParamsInteractorConverter extends ParamsInteractorConverter<
    AuthenticatorParams, AuthenticatorParamsInteractor> {
  const AuthenticatorParamsInteractorConverter();

  @override
  AuthenticatorParamsInteractor convert(AuthenticatorParams params,
          {Key? key}) =>
      AuthenticatorParamsInteractor(key: key, initial: params);
}
