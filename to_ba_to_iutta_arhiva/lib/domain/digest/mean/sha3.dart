part of "../index.dart";

class Sha3Digest extends _PointyCastleDigest {
  final ClassicDigestSize _size;
  Sha3Digest(ClassicDigestParams params)
      : _size = params.size,
        super(params, sha3.SHA3Digest(params.size.outputSize * 8));

  @override
  DigestData get data => DigestData(DigestImplementation.sha3,
      ClassicDigestParams(const DigestParams(), _size));

  @override
  int get blockSize => (_algorithm as sha3.SHA3Digest).rate;
}

class Sha3DigestImplementationConverter extends DigestImplementationConverter {
  const Sha3DigestImplementationConverter();

  @override
  Sha3Digest convert(covariant ClassicDigestParams params) =>
      Sha3Digest(params);
}
