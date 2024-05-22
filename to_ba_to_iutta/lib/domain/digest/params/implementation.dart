part of "../index.dart";

class DigestParamsImplementation
    extends ParamsImplementation<DigestParams, DigestParamsInteractor> {
  static const DigestParamsImplementation base = DigestParamsImplementation(
      null,
      DigestParamsInteractorConverter(),
      DigestParamsSerializer(),
      "Digest params",
      DigestParams());
  static const DigestParamsImplementation classic = DigestParamsImplementation(
      base,
      ClassicDigestParamsInteractorConverter(),
      ClassicDigestParamsSerializer(),
      "Classic digest params",
      ClassicDigestParams(ClassicDigestSize.x256));
  static const DigestParamsImplementation blake = DigestParamsImplementation(
      base,
      BlakeDigestParamsInteractorConverter(),
      BlakeDigestParamsSerializer(),
      "Blake digest params",
      BlakeDigestParams(
          BlakeSize.defaults(BlakeType.x2b), BlakeType.x2b));

  const DigestParamsImplementation(
      DigestParamsImplementation? super.underlying,
      DigestParamsInteractorConverter super.converter,
      DigestParamsSerializer super.serializer,
      super.name,
      super.defaults);
}
