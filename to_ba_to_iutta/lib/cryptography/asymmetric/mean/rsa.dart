part of "../index.dart";

class RsaAsymmetricCipher extends _PointyCastleAsymmetricCipher {
  @override
  final pc.AsymmetricBlockCipher algorithm;
  final AsymmetricCipherParams params;

  RsaAsymmetricCipher(this.params)
      : algorithm = (() {
          final engine = switch (params.engine) {
            AsymmetricCipherEngine.rsa => rsa.RSAEngine()
          };
          return switch (params.encoding) {
            AsymmetricEncoding.pkcs1 => pkcs1.PKCS1Encoding(engine),
            AsymmetricEncoding.oaep => oaep.OAEPEncoding(engine)
          };
        })(),
        super(params);

  @override
  AsymmetricCipherData get data =>
      AsymmetricCipherData(AsymmetricCipherImplementation.rsa, params);

  @override
  Future<AsymmetricCipherVariables> get newKey async {
    final generator = kg.RSAKeyGenerator()
      ..init(pc.ParametersWithRandom(
          RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64),
          fortuna.FortunaRandom()
            ..seed(pc.KeyParameter(platform.Platform.instance
                .platformEntropySource()
                .getBytes(32)))));
    final pair = generator.generateKeyPair();
    return AsymmetricCipherVariables(
        modulus: (pair.privateKey as pca.RSAPrivateKey).modulus!,
        exponent: (pair.privateKey as pca.RSAPrivateKey).privateExponent!,
        p: (pair.privateKey as pca.RSAPrivateKey).p!,
        q: (pair.privateKey as pca.RSAPrivateKey).q!);
  }

  @override
  pc.PrivateKeyParameter<pca.RSAPrivateKey> privateKey(
      AsymmetricCipherVariables variables) {
    if (variables.p == null || variables.q == null) {
      throw ArgumentError.notNull("Private exponent of asymmetric key");
    }
    if (variables.p == null || variables.q == null) {
      throw ArgumentError("Private parameters of asymmetric key not found");
    }
    return pc.PrivateKeyParameter<pca.RSAPrivateKey>(pca.RSAPrivateKey(
        variables.modulus, variables.exponent, variables.p, variables.q));
  }

  @override
  pc.PublicKeyParameter<pca.RSAPublicKey> publicKey(
          AsymmetricCipherVariables variables) =>
      pc.PublicKeyParameter<pca.RSAPublicKey>(
          pca.RSAPublicKey(variables.modulus, variables.exponent));

  @override
  AsymmetricCipherVariables extractPublicKey(
      AsymmetricCipherVariables variables) {
    final pk = privateKey(variables);
    return AsymmetricCipherVariables(
        modulus: pk.key.modulus!, exponent: pk.key.publicExponent!);
  }
}

class RsaAsymmetricCipherImplementationConverter
    extends AsymmetricCipherImplementationConverter {
  const RsaAsymmetricCipherImplementationConverter();
  @override
  AsymmetricCipher convert(AsymmetricCipherParams params) =>
      RsaAsymmetricCipher(params);
}
