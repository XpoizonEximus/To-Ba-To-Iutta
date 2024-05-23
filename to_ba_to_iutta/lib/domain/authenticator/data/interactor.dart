part of "../index.dart";

class AuthenticatorDataInteractor extends DataInteractor<AuthenticatorData> {
  const AuthenticatorDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator data",
      super.description =
          "Select the implementation wanted for the authenticator algorithm and its parameters."});

  @override
  InteractorState<AuthenticatorData, Interactor> createState() =>
      AuthenticatorDataInteractorState();
}

class AuthenticatorDataInteractorState extends DataInteractorState<
    AuthenticatorData, AuthenticatorDataInteractor> {
  final _implementationKey = AuthenticatorImplementationInteractorKey();
  final _paramsKey = AuthenticatorParamsInteractorKey();

  late AuthenticatorImplementation _implementation;

  @override
  void initState() {
    _implementation =
        widget.initial.implementation as AuthenticatorImplementation;
    super.initState();
  }

  @override
  Widget buildImplementation(BuildContext context) =>
      AuthenticatorImplementationInteractor(
        initial: widget.initial.implementation as AuthenticatorImplementation,
        onChanged: (implementation) => setState(() {
          _implementation = implementation;
        }),
      );

  @override
  Widget buildParams(BuildContext context) => _implementation.requiredParams
      .interactor(_implementation.requiredParams.defaults, key: _paramsKey);

  @override
  AuthenticatorData get current => AuthenticatorData(
      _implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef AuthenticatorDataInteractorKey<T extends AuthenticatorData>
    = InteractorKey<AuthenticatorDataInteractorState>;
