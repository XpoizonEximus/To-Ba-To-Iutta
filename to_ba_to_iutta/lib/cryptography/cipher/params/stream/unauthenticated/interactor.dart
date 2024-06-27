part of "../../../index.dart";

class UnauthenticatedStreamCipherParamsInteractor
    extends StreamCipherParamsInteractor {
  @override
  UnauthenticatedStreamCipherParams get initial =>
      super.initial as UnauthenticatedStreamCipherParams;

  const UnauthenticatedStreamCipherParamsInteractor(
      {super.key,
      required UnauthenticatedStreamCipherParams super.initial,
      super.title = "Stream cipher parameters",
      super.description =
          "These are the general parameters of the stream cipher. Authentication is handled separately using an authenticator."});

  @override
  AuthenticatedStreamCipherParamsInteractorState createState() =>
      AuthenticatedStreamCipherParamsInteractorState();
}

class UnauthenticatedStreamCipherParamsInteractorState<
        I extends UnauthenticatedStreamCipherParamsInteractor>
    extends StreamCipherParamsInteractorState<I> {
  final _authenticatorKey = AuthenticatorDataInteractorKey();
  final _engineKey = NamedEnumInteractorKey<UnauthenticatedStreamEngine>();
  final _roundsKey = IntInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<UnauthenticatedStreamEngine>(
        key: _engineKey,
        initial: widget.initial.engine,
        title: "Engine",
        description: "This is the algorithm itself used for encryption;",
        values: UnauthenticatedStreamEngine.values);
    yield AuthenticatorDataInteractor(
      key: _authenticatorKey,
      initial: widget.initial.authenticatorData,
      title: "Authenticator algorithm",
      description:
          "The cipher uses a authenticator to ensure the data has not been tampered with at the recieving end. Here update the data of the authenticator used.",
    );
    yield IntInteractor(
      key: _roundsKey,
      initial: widget.initial.rounds,
      title: "Rounds",
      description:
          "Stream ciphers work by applying the same algorithm multiple times on a key to generate a keystream. Here specify the number of times (20 recommended).",
      unitOfMeasure: "rounds",
    );
  }

  @override
  UnauthenticatedStreamCipherParams get current =>
      UnauthenticatedStreamCipherParams(
          _authenticatorKey.currentState?.current ??
              widget.initial.authenticatorData,
          _engineKey.currentState?.current ?? widget.initial.engine,
          _roundsKey.currentState?.current ?? widget.initial.rounds,
          super.current);
}

typedef UnauthenticatedStreamCipherParamsInteractorKey
    = InteractorKey<AuthenticatedStreamCipherParamsInteractorState>;
