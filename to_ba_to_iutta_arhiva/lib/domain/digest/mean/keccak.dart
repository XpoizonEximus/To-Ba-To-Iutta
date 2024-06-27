part of "../index.dart";

class KeccakDigest extends _PointyCastleDigest {
  final ClassicDigestSize _size;
  KeccakDigest(ClassicDigestParams params)
      : _size = params.size,
        super(params, keccak.KeccakDigest(params.size.outputSize * 8));

  @override
  DigestData get data =>
      DigestData(DigestImplementation.keccak, ClassicDigestParams(const DigestParams(), _size));

  @override
  int get blockSize => (_algorithm as keccak.KeccakDigest).rate;
}

class KeccakDigestImplementationConverter
    extends DigestImplementationConverter {
  const KeccakDigestImplementationConverter();
  @override
  KeccakDigest convert(covariant ClassicDigestParams params) =>
      KeccakDigest(params);
}
