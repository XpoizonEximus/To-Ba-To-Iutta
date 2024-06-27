part of "../../../index.dart";

class AuthenticatedBlockCipherParamsInteractor
    extends BlockCipherParamsInteractor {
  @override
  AuthenticatedBlockCipherParams get initial =>
      super.initial as AuthenticatedBlockCipherParams;

  const AuthenticatedBlockCipherParamsInteractor(
      {super.key,
      required AuthenticatedBlockCipherParams super.initial,
      super.title = "Block cipher parameters",
      super.description =
          "These are the general parameters of the block cipher. Authentication is handled by the MOO itself, so a separate authenticator is not needed."});

  @override
  AuthenticatedBlockCipherParamsInteractorState createState() =>
      AuthenticatedBlockCipherParamsInteractorState();
}

class AuthenticatedBlockCipherParamsInteractorState<
        I extends AuthenticatedBlockCipherParamsInteractor>
    extends BlockCipherParamsInteractorState<I> {
  final _mooKey = NamedEnumInteractorKey<AuthenticatedModeOfOperation>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<AuthenticatedModeOfOperation>(
        key: _mooKey,
        initial: widget.initial.moo,
        title: "Mode of operation",
        description:
            "This is the linker of the algorithm. The mode of operation tells the algorithm how to handle the succesive blocks of the input and also defines the authentication mechanism.",
        values: AuthenticatedModeOfOperation.values);
  }

  @override
  AuthenticatedBlockCipherParams get current => AuthenticatedBlockCipherParams(
      _mooKey.currentState?.current ?? widget.initial.moo, super.current);
}

typedef AuthenticatedBlockCipherParamsInteractorKey
    = InteractorKey<AuthenticatedBlockCipherParamsInteractorState>;
