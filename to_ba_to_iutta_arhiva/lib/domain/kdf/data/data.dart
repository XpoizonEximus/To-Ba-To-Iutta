part of "../index.dart";

class KdfData extends Data<Kdf, KdfParams> {
  KdfData(KdfImplementation super.implementation, super.params);

  static final defaults = KdfData(KdfImplementation.argon2id,
      KdfImplementation.argon2id.requiredParams.defaults);
}
