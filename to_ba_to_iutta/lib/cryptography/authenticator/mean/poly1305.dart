part of "../index.dart";

class Poly1305Authenticator extends _CryptographyAuthenticator {
  Poly1305Authenticator(FixedLengthKeyAuthenticatorParams params)
      : kdf = params.kdfData.newMean,
        super(params, c.Poly1305());

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

  @override
  int get nonceSize => 12;
  @override
  int get keySize => 16;
  @override
  final Kdf kdf;
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
  Poly1305Authenticator convert(
          covariant FixedLengthKeyAuthenticatorParams params) =>
      Poly1305Authenticator(params);
}
