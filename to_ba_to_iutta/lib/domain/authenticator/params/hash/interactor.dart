part of "../../index.dart";

class HashAuthenticatorParamsInteractor
    extends AuthenticatorParamsInteractor<HashAuthenticatorParams> {
  const HashAuthenticatorParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Authenticator parameters",
      super.description =
          "Used by the hmac authenticator. The main parameter is the digest used."});

  @override
  HashAuthenticatorParamsInteractorState createState() =>
      HashAuthenticatorParamsInteractorState();
}

class HashAuthenticatorParamsInteractorState
    extends AuthenticatorParamsInteractorState<HashAuthenticatorParams,
        HashAuthenticatorParamsInteractor> {
  final _key = DigestDataInteractorKey();

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.buildContent(context),
        DigestDataInteractor(
          key: _key,
          initial: widget.initial.digestData,
          title: "Digest algorithm",
          description:
              "This algorithm uses a digest to compute the authentication code (mac). Here update the data of the digest used.",
        )
      ],
    );
  }

  @override
  HashAuthenticatorParams get current => HashAuthenticatorParams(
      _key.currentState?.current ?? widget.initial.digestData);
}

typedef HashAuthenticatorParamsInteractorKey
    = InteractorKey<HashAuthenticatorParamsInteractorState>;
