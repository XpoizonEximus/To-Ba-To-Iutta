part of "../index.dart";

class HashKdf extends _CryptographyKdf {
  final Digest _digest;
  HashKdf(HashKdfParams super.params) : _digest = params.digestData.newMean;

  @override
  KdfData get data => KdfData(KdfImplementation.hash,
      HashKdfParams(KdfParams(nonceSize), _digest.data));

  @override
  c.Hkdf algorithm(KdfVariables variables) => c.Hkdf(
      hmac: c.Hmac(PackageCryptographyDigestAdapter(_digest)),
      outputLength: variables.size);
}

class HashKdfImplementationConverter extends KdfImplementationConverter {
  const HashKdfImplementationConverter();

  @override
  HashKdf convert(covariant HashKdfParams params) => HashKdf(params);
}
