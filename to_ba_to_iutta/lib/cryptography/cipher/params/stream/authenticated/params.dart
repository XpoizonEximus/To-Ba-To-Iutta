part of "../../../index.dart";

enum AuthenticatedStreamEngine implements Named {
  chacha20("ChaCha20"),
  xchacha20("XChaCha20");

  @override
  final String name;

  const AuthenticatedStreamEngine(this.name);
}

class AuthenticatedStreamCipherParams extends StreamCipherParams {
  final AuthenticatedStreamEngine engine;

  AuthenticatedStreamCipherParams(this.engine, StreamCipherParams underlying)
      : super.fromParams(underlying);

  AuthenticatedStreamCipherParams.fromParams(
      AuthenticatedStreamCipherParams params)
      : this(params.engine, params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.authenticatedStream;
}

class AuthenticatedStreamCipherParamsInteractorConverter
    extends StreamCipherParamsInteractorConverter {
  const AuthenticatedStreamCipherParamsInteractorConverter();

  @override
  AuthenticatedStreamCipherParamsInteractor convert(
          covariant AuthenticatedStreamCipherParams params,
          {Key? key}) =>
      AuthenticatedStreamCipherParamsInteractor(key: key, initial: params);
}
