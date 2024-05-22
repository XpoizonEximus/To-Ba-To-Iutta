part of "../index.dart";

class BlakeDigest extends CryptographyDigest {
  final BlakeType _type;
  BlakeDigest(BlakeDigestParams params)
      : _type = params.type,
        super(
            params,
            switch (params.type) {
              BlakeType.x2b =>
                c.Blake2b(hashLengthInBytes: params.outputSize.value)
                    as c.HashAlgorithm,
              BlakeType.x2s =>
                c.Blake2s(hashLengthInBytes: params.outputSize.value)
                    as c.HashAlgorithm,
            });
  @override
  DigestData get data => DigestData(DigestImplementation.blake,
      BlakeDigestParams(BlakeSize(outputSize, _type), _type));

  @override
  int get blockSize => _algorithm.blockLengthInBytes;
}

class BlakeDigestImplementationConverter extends DigestImplementationConverter {
  const BlakeDigestImplementationConverter();
  @override
  BlakeDigest convert(covariant BlakeDigestParams params) =>
      BlakeDigest(params);
}
