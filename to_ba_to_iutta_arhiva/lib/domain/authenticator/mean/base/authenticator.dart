part of "../../index.dart";

abstract class Authenticator extends Mean {
  const Authenticator(AuthenticatorParams super.params);

  @override
  AuthenticatorData get data;

  Future<Bytes> get newNonce async => SecureBytesGenerator(nonceSize).get;
  Future<Bytes> get newKey async => SecureBytesGenerator(keySize).get;  

  int get outputSize;

  int get nonceSize;
  int get keySize;
  Kdf get kdf;

  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true});

  AuthenticatorProcessor newProcessor(AuthenticatorVariables variables,
      {bool syncronized = true});
}

abstract class AuthenticatorProcessor extends Processor {
  AuthenticatorVariables variables;
  AuthenticatorProcessor(this.variables, {super.syncronized = true});
}
