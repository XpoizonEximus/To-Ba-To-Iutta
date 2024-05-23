part of "../index.dart";

class AesCmacAuthenticator extends _PointyCastleAuthenticator {
  const AesCmacAuthenticator(super.params);

  @override
  AuthenticatorData get data => AuthenticatorData(
      AuthenticatorImplementation.aesCmac, const AuthenticatorParams());

  @override
  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true}) {
    f() => (cmac.CMac.fromCipher(aes.AESEngine())
          ..init(pc.KeyParameter(variables.key)))
        .process(input);

    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }

  @override
  AesCmacAuthenticatorProcessor newProcessor(AuthenticatorVariables variables,
          {bool syncronized = true}) =>
      AesCmacAuthenticatorProcessor(
          cmac.CMac.fromCipher(aes.AESEngine()), variables,
          syncronized: syncronized);

  @override
  int get outputSize => cmac.CMac.fromCipher(aes.AESEngine()).macSize;
}

class AesCmacAuthenticatorProcessor
    extends _PointyCastleAuthenticatorProcessor {
  @override
  final cmac.CMac algorithm;

  AesCmacAuthenticatorProcessor(
      cmac.CMac algorithm, super.variables,
      {super.syncronized})
      : algorithm = algorithm..init(pc.KeyParameter(variables.key));

  @override
  set variables(AuthenticatorVariables variables) {
    super.variables = variables;
    algorithm.init(pc.KeyParameter(variables.key));
  }
}

class AesCmacAuthenticatorImplementationConverter
    extends AuthenticatorImplementationConverter {
  const AesCmacAuthenticatorImplementationConverter();

  @override
  AesCmacAuthenticator convert(AuthenticatorParams params) =>
      AesCmacAuthenticator(params);
}
