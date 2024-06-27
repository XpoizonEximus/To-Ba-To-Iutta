part of "../index.dart";

class DigestData extends Data<Digest, DigestParams> {
  DigestData(DigestImplementation super.implementation, super.params);

  static final defaults = DigestData(DigestImplementation.sha2,
      DigestImplementation.sha2.requiredParams.defaults);
}
