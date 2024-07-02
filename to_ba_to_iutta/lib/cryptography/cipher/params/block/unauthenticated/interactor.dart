part of "../../../index.dart";

class UnauthenticatedBlockCipherParamsInteractor
    extends BlockCipherParamsInteractor {
  @override
  UnauthenticatedBlockCipherParams get initial =>
      super.initial as UnauthenticatedBlockCipherParams;

  const UnauthenticatedBlockCipherParamsInteractor(
      {super.key,
      required UnauthenticatedBlockCipherParams super.initial,
      super.title = "Block cipher parameters",
      super.description =
          "These are the general parameters of the block cipher. Authentication is handled separately using an authenticator."});

  @override
  UnauthenticatedBlockCipherParamsInteractorState createState() =>
      UnauthenticatedBlockCipherParamsInteractorState();
}

class UnauthenticatedBlockCipherParamsInteractorState<
        I extends UnauthenticatedBlockCipherParamsInteractor>
    extends BlockCipherParamsInteractorState<I> {
  final _authenticatorKey = AuthenticatorDataInteractorKey();
  final _mooKey = NamedEnumInteractorKey<UnauthenticatedModeOfOperation>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<UnauthenticatedModeOfOperation>(
        key: _mooKey,
        initial: (initial as UnauthenticatedBlockCipherParams).moo,
        title: "Mode of operation",
        description:
            "This is the linker of the algorithm. The mode of operation tells the algorithm how to handle the succesive blocks of the input.",
        values: UnauthenticatedModeOfOperation.values);
    yield AuthenticatorDataInteractor(
      key: _authenticatorKey,
      initial: (initial as UnauthenticatedBlockCipherParams).authenticatorData,
      title: "Authenticator algorithm",
      description:
          "The cipher uses a authenticator to ensure the data has not been tampered with at the recieving end. Here update the data of the authenticator used.",
    );
  }

  @override
  UnauthenticatedBlockCipherParams get current =>
      UnauthenticatedBlockCipherParams(_authenticatorKey.currentState!.current,
          _mooKey.currentState!.current, super.current);
}

typedef UnauthenticatedBlockCipherParamsInteractorKey
    = InteractorKey<AuthenticatedBlockCipherParamsInteractorState>;
