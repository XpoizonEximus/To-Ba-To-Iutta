part of "../index.dart";

class KdfData extends Data<Kdf, KdfParams> {
  KdfData(
      KdfImplementation super.implementation, super.params);

  static final defaults = KdfData(KdfImplementation.hash,
      KdfImplementation.hash.requiredParams.defaults);
}
