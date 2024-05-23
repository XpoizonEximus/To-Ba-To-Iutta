part of "../index.dart";

class HashAuthenticator extends _CryptographyAuthenticator {
  final DigestData digestData;
  HashAuthenticator(HashAuthenticatorParams params)
      : digestData = params.digestData,
        super(
            params,
            c.Hmac(
                PackageCryptographyDigestAdapter(params.digestData.newMean)));

  @override
  AuthenticatorData get data => AuthenticatorData(
      AuthenticatorImplementation.hash, HashAuthenticatorParams(digestData));
}

class HashAuthenticatorImplementationConverter
    extends AuthenticatorImplementationConverter {
  const HashAuthenticatorImplementationConverter();

  @override
  HashAuthenticator convert(covariant HashAuthenticatorParams params) =>
      HashAuthenticator(params);
}
