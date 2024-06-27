part of "../index.dart";

class BlakeDigest extends CryptographyDigest {
  final BlakeDigestType _type;
  BlakeDigest(BlakeDigestParams params)
      : _type = params.type,
        super(
            params,
            switch (params.type) {
              BlakeDigestType.x2b =>
                c.Blake2b(hashLengthInBytes: params._outputSize.value)
                    as c.HashAlgorithm,
              BlakeDigestType.x2s =>
                c.Blake2s(hashLengthInBytes: params._outputSize.value)
                    as c.HashAlgorithm,
            });
  @override
  DigestData get data => DigestData(DigestImplementation.blake,
      BlakeDigestParams(const DigestParams(), _type, outputSize));
}

class BlakeDigestImplementationConverter extends DigestImplementationConverter {
  const BlakeDigestImplementationConverter();
  @override
  BlakeDigest convert(covariant BlakeDigestParams params) =>
      BlakeDigest(params);
}
