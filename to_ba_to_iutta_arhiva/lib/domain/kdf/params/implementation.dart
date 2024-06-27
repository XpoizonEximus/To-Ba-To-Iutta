part of "../index.dart";

class KdfParamsImplementation
    extends ParamsImplementation<KdfParams, KdfParamsInteractor> {
  static final values = [base, argon2Id, hash, scrypt];
  static const base = KdfParamsImplementation(
      null,
      KdfParamsInteractorConverter(),
      KdfParamsSerializer(),
      "Kdf params",
      KdfParams(16));

  static final argon2Id = KdfParamsImplementation(
      base,
      const Argon2IdKdfParamsInteractorConverter(),
      const Argon2IdKdfParamsSerializer(),
      "Argon2id params",
      Argon2IdKdfParams(base.defaults,
          iterations: 3, memory: 4096, parallelism: 1));

  static final hash = KdfParamsImplementation(
      base,
      const HashKdfParamsInteractorConverter(),
      HashKdfParamsSerializer(),
      "Hkdf params",
      HashKdfParams(base.defaults, DigestData.defaults));

  static final scrypt = KdfParamsImplementation(
      base,
      const ScryptKdfParamsInteractorConverter(),
      const ScryptKdfParamsSerializer(),
      "Scrypt params",
      ScryptKdfParams(base.defaults,
          costFactorExponent: 14,
          blockSizeFactor: 8,
          parallelisationFactor: 1));

  const KdfParamsImplementation(
      KdfParamsImplementation? super.underlying,
      KdfParamsInteractorConverter super.converter,
      KdfParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
