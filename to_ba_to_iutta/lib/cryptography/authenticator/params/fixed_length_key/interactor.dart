part of "../../index.dart";

class FixedLengthKeyAuthenticatorParamsInteractor
    extends AuthenticatorParamsInteractor {
  @override
  FixedLengthKeyAuthenticatorParams get initial =>
      super.initial as FixedLengthKeyAuthenticatorParams;

  const FixedLengthKeyAuthenticatorParamsInteractor(
      {super.key,
      required FixedLengthKeyAuthenticatorParams super.initial,
      super.title = "Fixed-length key authenticator parameters",
      super.description =
          "Used by the authenticators that require fixed-length keys. The main parameter is related to the key derivator."});

  @override
  FixedLengthKeyAuthenticatorParamsInteractorState createState() =>
      FixedLengthKeyAuthenticatorParamsInteractorState();
}

class FixedLengthKeyAuthenticatorParamsInteractorState
    extends AuthenticatorParamsInteractorState<
        FixedLengthKeyAuthenticatorParamsInteractor> {
  final _key = KdfDataInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield KdfDataInteractor(
      key: _key,
      initial: widget.initial.kdfData,
      title: "Kdf algorithm",
      description:
          "This algorithm uses a kdf to get the key size to a required length.",
    );
  }

  @override
  FixedLengthKeyAuthenticatorParams get current =>
      FixedLengthKeyAuthenticatorParams(
          super.current, _key.currentState?.current ?? widget.initial.kdfData);
}

typedef FixedLengthKeyAuthenticatorParamsInteractorKey
    = InteractorKey<FixedLengthKeyAuthenticatorParamsInteractorState>;
