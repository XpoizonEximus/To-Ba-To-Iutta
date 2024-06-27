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
          "These are the general parameters of the block cipher. The mode of operation handles authentication, too."});

  @override
  AuthenticatedBlockCipherParamsInteractorState createState() =>
      AuthenticatedBlockCipherParamsInteractorState();
}

class AuthenticatedBlockCipherParamsInteractorState
    extends BlockCipherParamsInteractorState<
        AuthenticatedBlockCipherParamsInteractor> {
  final _mooKey = NamedEnumInteractorKey<AuthenticatedModeOfOperation>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield NamedEnumInteractor<AuthenticatedModeOfOperation>(
        key: _mooKey,
        initial: widget.initial.moo,
        title: "Authenticated mode of operation",
        description:
            "This is the linker of the algorithm. The mode of operation tells the algorithm how to handle the succesive blocks of the input. Additionally, an authenticated MOO handles the authentication part too.",
        values: AuthenticatedModeOfOperation.values);
    yield* super.buildParams(context);
  }

  @override
  AuthenticatedBlockCipherParams get current => AuthenticatedBlockCipherParams(
      _mooKey.currentState?.current ?? widget.initial.moo, super.current);
}

typedef AuthenticatedBlockCipherParamsInteractorKey
    = InteractorKey<AuthenticatedBlockCipherParamsInteractorState>;
