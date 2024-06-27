part of "../index.dart";

class EmptyAuthenticator extends Authenticator {
  const EmptyAuthenticator(super.params);

  @override
  AuthenticatorData get data => AuthenticatorData(
      AuthenticatorImplementation.empty, const AuthenticatorParams());

  @override
  EmptyAuthenticatorProcessor newProcessor(AuthenticatorVariables variables,
          {bool syncronized = true}) =>
      EmptyAuthenticatorProcessor(variables, syncronized: syncronized);

  @override
  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true}) {
    f() => Bytes.fromList([]);
    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }

  @override
  int get outputSize => 0;

  @override
  int get nonceSize => 0;
  @override
  int get keySize => -1;
  @override
  Kdf get kdf => KdfImplementation.empty
      .newMean(KdfImplementation.empty.requiredParams.defaults);
}

class EmptyAuthenticatorProcessor extends AuthenticatorProcessor {
  EmptyAuthenticatorProcessor(super.variables, {super.syncronized = true});

  @override
  void put(Bytes chunk) {}

  @override
  FutureOr<Bytes> get result {
    f() => Bytes.fromList([]);
    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }
}

class EmptyAuthenticatorImplementationConverter
    extends AuthenticatorImplementationConverter {
  const EmptyAuthenticatorImplementationConverter();

  @override
  EmptyAuthenticator convert(AuthenticatorParams params) =>
      EmptyAuthenticator(params);
}
