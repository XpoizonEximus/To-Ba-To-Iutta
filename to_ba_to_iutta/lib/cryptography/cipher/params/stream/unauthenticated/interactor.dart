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
  UnauthenticatedStreamCipherParamsInteractorState createState() =>
      UnauthenticatedStreamCipherParamsInteractorState();
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
        initial: (initial as UnauthenticatedStreamCipherParams).engine,
        title: "Engine",
        description: "This is the algorithm itself used for encryption;",
        values: UnauthenticatedStreamEngine.values);
    yield AuthenticatorDataInteractor(
      key: _authenticatorKey,
      initial: (initial as UnauthenticatedStreamCipherParams).authenticatorData,
      title: "Authenticator algorithm",
      description:
          "The cipher uses a authenticator to ensure the data has not been tampered with at the recieving end. Here update the data of the authenticator used.",
    );
    yield IntInteractor(
      key: _roundsKey,
      initial: (initial as UnauthenticatedStreamCipherParams).rounds,
      title: "Rounds",
      description:
          "Stream ciphers work by applying the same algorithm multiple times on a key to generate a keystream. Here specify the number of times (20 recommended).",
      unitOfMeasure: "rounds",
    );
  }

  @override
  UnauthenticatedStreamCipherParams get current =>
      UnauthenticatedStreamCipherParams(
          _authenticatorKey.currentState!.current,
          _engineKey.currentState!.current,
          _roundsKey.currentState!.current,
          super.current);
}

typedef UnauthenticatedStreamCipherParamsInteractorKey
    = InteractorKey<AuthenticatedStreamCipherParamsInteractorState>;
