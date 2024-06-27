part of "../index.dart";

class AuthenticatorData extends Data<Authenticator, AuthenticatorParams> {
  AuthenticatorData(
      AuthenticatorImplementation super.implementation, super.params);

  static final defaults = AuthenticatorData(AuthenticatorImplementation.hash,
      AuthenticatorImplementation.hash.requiredParams.defaults);
}
