part of "../../index.dart";

class HashAuthenticatorParamsInteractor extends AuthenticatorParamsInteractor {
  @override
  HashAuthenticatorParams get initial =>
      super.initial as HashAuthenticatorParams;

  const HashAuthenticatorParamsInteractor(
      {super.key,
      required HashAuthenticatorParams super.initial,
      super.title = "Hmac authenticator parameters",
      super.description =
          "Used by the hmac authenticator. The main parameter is the digest used."});

  @override
  HashAuthenticatorParamsInteractorState createState() =>
      HashAuthenticatorParamsInteractorState();
}

class HashAuthenticatorParamsInteractorState
    extends AuthenticatorParamsInteractorState<
        HashAuthenticatorParamsInteractor> {
  final _key = DigestDataInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield DigestDataInteractor(
      key: _key,
      initial: (initial as HashAuthenticatorParams).digestData,
      title: "Digest algorithm",
      description:
          "This algorithm uses a digest to compute the authentication code (mac). Here update the data of the digest used.",
    );
  }

  @override
  HashAuthenticatorParams get current =>
      HashAuthenticatorParams(super.current, _key.currentState!.current);
}

typedef HashAuthenticatorParamsInteractorKey
    = InteractorKey<HashAuthenticatorParamsInteractorState>;
