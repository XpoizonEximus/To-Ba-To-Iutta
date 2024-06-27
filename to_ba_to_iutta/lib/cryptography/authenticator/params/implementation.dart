part of "../index.dart";

class AuthenticatorParamsImplementation extends ParamsImplementation<
    AuthenticatorParams, AuthenticatorParamsInteractor> {
  static final values = [base, hash, fixedLengthKey];

  static const base = AuthenticatorParamsImplementation(
      null,
      AuthenticatorParamsInteractorConverter(),
      AuthenticatorParamsSerializer(),
      "Authenticator params",
      AuthenticatorParams());

  static final hash = AuthenticatorParamsImplementation(
      base,
      const HashAuthenticatorParamsInteractorConverter(),
      HashAuthenticatorParamsSerializer(),
      "Hmac authenticator params",
      HashAuthenticatorParams(base.defaults, DigestData.defaults));

  static final fixedLengthKey = AuthenticatorParamsImplementation(
      base,
      const FixedLengthKeyAuthenticatorParamsInteractorConverter(),
      FixedLengthKeyAuthenticatorParamsSerializer(),
      "Fixed-length key authenticator params",
      FixedLengthKeyAuthenticatorParams(
          base.defaults,
          KdfData(KdfImplementation.hash,
              KdfImplementation.hash.requiredParams.defaults)));

  const AuthenticatorParamsImplementation(
      AuthenticatorParamsImplementation? super.underlying,
      AuthenticatorParamsInteractorConverter super.converter,
      AuthenticatorParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
