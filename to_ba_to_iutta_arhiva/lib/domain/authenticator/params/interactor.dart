part of "../index.dart";

class AuthenticatorParamsInteractor
    extends ParamsInteractor<AuthenticatorParams> {
  const AuthenticatorParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator parameters",
      super.description =
          "This type of Authenticator does not have adjustable parameters."});

  @override
  AuthenticatorParamsInteractorState<AuthenticatorParamsInteractor>
      createState() =>
          AuthenticatorParamsInteractorState<AuthenticatorParamsInteractor>();
}

class AuthenticatorParamsInteractorState<
        I extends AuthenticatorParamsInteractor>
    extends ParamsInteractorState<AuthenticatorParams, I> {
  @override
  Iterable<Widget> buildParams(BuildContext context) => [];

  @override
  AuthenticatorParams get current => const AuthenticatorParams();
}

typedef AuthenticatorParamsInteractorKey = InteractorKey<
    AuthenticatorParamsInteractorState<AuthenticatorParamsInteractor>>;
