part of "../../../index.dart";

class AuthenticatedStreamCipherParamsInteractor
    extends StreamCipherParamsInteractor {
  @override
  AuthenticatedStreamCipherParams get initial =>
      super.initial as AuthenticatedStreamCipherParams;

  const AuthenticatedStreamCipherParamsInteractor(
      {super.key,
      required AuthenticatedStreamCipherParams super.initial,
      super.title = "Stream cipher parameters",
      super.description =
          "These are the general parameters of the stream cipher. Authentication is handled by the engine itself, so a separate authenticator is not needed."});

  @override
  AuthenticatedStreamCipherParamsInteractorState createState() =>
      AuthenticatedStreamCipherParamsInteractorState();
}

class AuthenticatedStreamCipherParamsInteractorState<
        I extends AuthenticatedStreamCipherParamsInteractor>
    extends StreamCipherParamsInteractorState<I> {
  final _engineKey = NamedEnumInteractorKey<AuthenticatedStreamEngine>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<AuthenticatedStreamEngine>(
        key: _engineKey,
        initial: (initial as AuthenticatedStreamCipherParams).engine,
        title: "Engine",
        description:
            "This is the algorithm itself. It is also coupled with a specialized version of the Poly1305 authenticator to provide data integrity assurance.",
        values: AuthenticatedStreamEngine.values);
  }

  @override
  AuthenticatedStreamCipherParams get current =>
      AuthenticatedStreamCipherParams(
          _engineKey.currentState!.current, super.current);
}

typedef AuthenticatedStreamCipherParamsInteractorKey
    = InteractorKey<AuthenticatedStreamCipherParamsInteractorState>;
