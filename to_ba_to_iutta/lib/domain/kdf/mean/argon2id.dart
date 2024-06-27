part of "../index.dart";

class Argon2IdKdf extends _CryptographyKdf {
  final Argon2IdKdfParams _params;
  Argon2IdKdf(this._params) : super(_params);

  @override
  KdfData get data => KdfData(KdfImplementation.argon2id, _params);

  @override
  c.Argon2id algorithm(KdfVariables variables) => c.Argon2id(
      hashLength: variables.size,
      parallelism: _params.parallelism,
      memory: _params.memory,
      iterations: _params.iterations);
}

class Argon2IdKdfImplementationConverter extends KdfImplementationConverter {
  const Argon2IdKdfImplementationConverter();

  @override
  Argon2IdKdf convert(covariant Argon2IdKdfParams params) =>
      Argon2IdKdf(params);
}
