part of "../index.dart";

class AuthenticatorParamsInteractor<T extends AuthenticatorParams>
    extends ParamsInteractor<T> {
  const AuthenticatorParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator parameters",
      super.description =
          "This type of Authenticator does not have adjustable parameters."});

  @override
  AuthenticatorParamsInteractorState<T, AuthenticatorParamsInteractor<T>> createState() =>
      AuthenticatorParamsInteractorState<T, AuthenticatorParamsInteractor<T>>();
}

class AuthenticatorParamsInteractorState<T extends AuthenticatorParams,
    I extends AuthenticatorParamsInteractor> extends ParamsInteractorState<T, I> {
  @override
  Widget buildContent(BuildContext context) => const SizedBox.shrink();
}

typedef AuthenticatorParamsInteractorKey<T extends AuthenticatorParams>
    = InteractorKey<AuthenticatorParamsInteractorState<T, AuthenticatorParamsInteractor>>;