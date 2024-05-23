part of "../index.dart";

class KdfParamsImplementation extends ParamsImplementation<
    KdfParams, KdfParamsInteractor> {
  static final values = [base, hash];
  static const base = KdfParamsImplementation(
      null,
      KdfParamsInteractorConverter(),
      KdfParamsSerializer(),
      "Kdf params",
      KdfParams());
  static final hash = KdfParamsImplementation(
      base,
      const HashKdfParamsInteractorConverter(),
      const HashKdfParamsSerializer(),
      "Hmac Kdf params",
      HashKdfParams(DigestData.defaults));

  const KdfParamsImplementation(super.underlying, super.converter,
      super.serializer, super.name, super.defaults);
}
