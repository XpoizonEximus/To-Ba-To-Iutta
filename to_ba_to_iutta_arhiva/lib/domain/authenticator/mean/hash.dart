part of "../index.dart";

class HashAuthenticator extends _CryptographyAuthenticator {
  final Digest digest;
  HashAuthenticator(HashAuthenticatorParams params)
      : digest = params.digestData.newMean,
        super(
            params,
            c.Hmac(
                PackageCryptographyDigestAdapter(params.digestData.newMean)));

  @override
  AuthenticatorData get data => AuthenticatorData(
      AuthenticatorImplementation.hash,
      HashAuthenticatorParams(const AuthenticatorParams(), digest.data));

  @override
  int get nonceSize => -1;
  @override
  int get keySize => -1;
  @override
  Kdf get kdf => KdfImplementation.empty
      .newMean(KdfImplementation.empty.requiredParams.defaults);
}

class HashAuthenticatorImplementationConverter
    extends AuthenticatorImplementationConverter {
  const HashAuthenticatorImplementationConverter();

  @override
  HashAuthenticator convert(covariant HashAuthenticatorParams params) =>
      HashAuthenticator(params);
}
