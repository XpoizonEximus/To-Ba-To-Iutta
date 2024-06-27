part of "../../../index.dart";

enum UnauthenticatedStreamEngine implements Named {
  chacha20("ChaCha20"),
  xchacha20("XChaCha20"),
  salsa20("Salsa20"),
  chacha7539("ChaCha7539");

  @override
  final String name;

  const UnauthenticatedStreamEngine(this.name);
}

class UnauthenticatedStreamCipherParams extends StreamCipherParams {
  final AuthenticatorData authenticatorData;
  final UnauthenticatedStreamEngine engine;
  final int rounds;

  UnauthenticatedStreamCipherParams(this.authenticatorData, this.engine,
      this.rounds, StreamCipherParams underlying)
      : super.fromParams(underlying) {
    if (rounds != 20 &&
        (engine == UnauthenticatedStreamEngine.xchacha20 ||
            engine == UnauthenticatedStreamEngine.salsa20)) {
      throw ArgumentError(
          "${UnauthenticatedStreamEngine.xchacha20.name} and ${UnauthenticatedStreamEngine.salsa20.name} must use 20 rounds");
    }
  }

  UnauthenticatedStreamCipherParams.fromParams(
      UnauthenticatedStreamCipherParams params)
      : this(params.authenticatorData, params.engine, params.rounds, params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.unauthenticatedStream;
}

class UnauthenticatedStreamCipherParamsInteractorConverter
    extends StreamCipherParamsInteractorConverter {
  const UnauthenticatedStreamCipherParamsInteractorConverter();

  @override
  UnauthenticatedStreamCipherParamsInteractor convert(
          covariant UnauthenticatedStreamCipherParams params,
          {Key? key}) =>
      UnauthenticatedStreamCipherParamsInteractor(key: key, initial: params);
}
