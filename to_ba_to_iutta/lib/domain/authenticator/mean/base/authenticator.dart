part of "../../index.dart";

abstract class Authenticator extends Mean {
  const Authenticator(AuthenticatorParams super.params);

  @override
  AuthenticatorData get data;

  int get outputSize;

  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true});

  AuthenticatorProcessor newProcessor(AuthenticatorVariables variables,
      {bool syncronized = true});
}

abstract class AuthenticatorProcessor extends Processor {
  AuthenticatorVariables variables;
  AuthenticatorProcessor(this.variables, {super.syncronized = true});
}
