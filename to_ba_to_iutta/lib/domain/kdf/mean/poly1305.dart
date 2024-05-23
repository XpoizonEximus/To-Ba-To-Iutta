part of "../index.dart";

class Poly1305Authenticator extends _CryptographyAuthenticator {
  Poly1305Authenticator(AuthenticatorParams params)
      : super(params, c.Poly1305());

  @override
  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true}) {
    if (variables.nonce.isEmpty) {
      throw ArgumentError(
          "Nonce can't be empty when used with a Poly1305 authenticator");
    }
    return super.process(input, variables, syncronized: syncronized);
  }

  @override
  Poly1305AuthenticatorProcessor newProcessor(AuthenticatorVariables variables,
      {bool syncronized = true}) {
    if (variables.nonce.isEmpty) {
      throw ArgumentError(
          "Nonce can't be empty when used with a Poly1305 authenticator");
    }
    return Poly1305AuthenticatorProcessor(super._algorithm, variables,
        syncronized: syncronized);
  }

  @override
  AuthenticatorData get data => AuthenticatorData(
      AuthenticatorImplementation.poly1305, const AuthenticatorParams());
}

class Poly1305AuthenticatorProcessor
    extends _CryptographyAuthenticatorProcessor {
  Poly1305AuthenticatorProcessor(super.algorithm, super.variables,
      {super.syncronized = true});

  @override
  set variables(AuthenticatorVariables variables) {
    if (variables.nonce.isEmpty) {
      throw ArgumentError(
          "Nonce can't be empty when used with a Poly1305 authenticator");
    }
    super.variables = variables;
  }
}

class Poly1305AuthenticatorImplementationConverter
    extends AuthenticatorImplementationConverter {
  const Poly1305AuthenticatorImplementationConverter();

  @override
  Poly1305Authenticator convert(AuthenticatorParams params) =>
      Poly1305Authenticator(params);
}
