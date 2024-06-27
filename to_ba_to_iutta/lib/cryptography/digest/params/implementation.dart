part of "../index.dart";

class DigestParamsImplementation
    extends ParamsImplementation<DigestParams, DigestParamsInteractor> {
  static final values = [base, classic, blake];
  static const DigestParamsImplementation base = DigestParamsImplementation(
      null,
      DigestParamsInteractorConverter(),
      DigestParamsSerializer(),
      "Digest params",
      DigestParams());
  static final DigestParamsImplementation classic = DigestParamsImplementation(
      base,
      const ClassicDigestParamsInteractorConverter(),
      const ClassicDigestParamsSerializer(),
      "Classic digest params",
      ClassicDigestParams(base.defaults, ClassicDigestSize.x256));
  static final DigestParamsImplementation blake = DigestParamsImplementation(
      base,
      const BlakeDigestParamsInteractorConverter(),
      const BlakeDigestParamsSerializer(),
      "Blake digest params",
      BlakeDigestParams(base.defaults, BlakeDigestType.x2b,
          BlakeDigestSize.defaults(BlakeDigestType.x2b).value));

  const DigestParamsImplementation(
      DigestParamsImplementation? super.underlying,
      DigestParamsInteractorConverter super.converter,
      DigestParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
