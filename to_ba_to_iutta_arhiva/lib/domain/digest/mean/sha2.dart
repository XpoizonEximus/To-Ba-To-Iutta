part of "../index.dart";

class Sha2Digest extends CryptographyDigest {
  final ClassicDigestSize _size;
  Sha2Digest(ClassicDigestParams params)
      : _size = params.size,
        super(
            params,
            switch (params.size) {
              ClassicDigestSize.x224 => c.Sha224(),
              ClassicDigestSize.x256 => c.Sha256(),
              ClassicDigestSize.x384 => c.Sha384(),
              ClassicDigestSize.x512 => c.Sha512()
            });
  @override
  DigestData get data =>
      DigestData(DigestImplementation.sha2, ClassicDigestParams(const DigestParams(), _size));
}

class Sha2DigestImplementationConverter extends DigestImplementationConverter {
  const Sha2DigestImplementationConverter();
  @override
  Sha2Digest convert(covariant ClassicDigestParams params) =>
      Sha2Digest(params);
}
