part of "../index.dart";

class AuthenticatorParamsImplementation extends ParamsImplementation<
    AuthenticatorParams, AuthenticatorParamsInteractor> {
  static final values = [base, hash];
  static const base = AuthenticatorParamsImplementation(
      null,
      AuthenticatorParamsInteractorConverter(),
      AuthenticatorParamsSerializer(),
      "Authenticator params",
      AuthenticatorParams());
  static final hash = AuthenticatorParamsImplementation(
      base,
      const HashAuthenticatorParamsInteractorConverter(),
      const HashAuthenticatorParamsSerializer(),
      "Hmac authenticator params",
      HashAuthenticatorParams(DigestData.defaults));

  const AuthenticatorParamsImplementation(super.underlying, super.converter,
      super.serializer, super.name, super.defaults);
}
