part of "../index.dart";

class AuthenticatorDataInteractor extends DataInteractor<AuthenticatorData> {
  const AuthenticatorDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator data",
      super.description =
          "Select the implementation wanted for the authenticator algorithm and its parameters."});

  @override
  AuthenticatorDataInteractorState createState() =>
      AuthenticatorDataInteractorState();
}

class AuthenticatorDataInteractorState extends DataInteractorState<
    AuthenticatorData, AuthenticatorDataInteractor> {
  final _implementationKey = AuthenticatorImplementationInteractorKey();
  final _paramsKey = AuthenticatorParamsInteractorKey();

  @override
  AuthenticatorImplementationInteractor buildImplementation(
          BuildContext context) =>
      AuthenticatorImplementationInteractor(
        key: _implementationKey,
        initial: implementation as AuthenticatorImplementation,
        onChanged: changeImplementation,
      );

  @override
  ParamsInteractor buildParams(BuildContext context) =>
      implementation.requiredParams.interactor(params, key: _paramsKey);

  @override
  AuthenticatorData get current => AuthenticatorData(
      _implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef AuthenticatorDataInteractorKey<T extends AuthenticatorData>
    = InteractorKey<AuthenticatorDataInteractorState>;
