part of "../index.dart";

class Sm3Digest extends _PointyCastleDigest {
  Sm3Digest(DigestParams params) : super(params, sm3.SM3Digest());

  @override
  DigestData get data =>
      DigestData(DigestImplementation.sm3, const DigestParams());

  @override
  int get blockSize => 512 ~/ 8;
}

class Sm3DigestImplementationConverter extends DigestImplementationConverter {
  const Sm3DigestImplementationConverter();

  @override
  Sm3Digest convert(DigestParams params) => Sm3Digest(params);
}
