part of "../index.dart";

class DigestParamsSerializer extends ParamsSerializer<DigestParams> {
  const DigestParamsSerializer();

  @override
  Future<DigestParams> load(Stream<Byte> input) =>
      Future<DigestParams>.value(const DigestParams());

  @override
  Stream<Byte> serialize(DigestParams input) => const Stream.empty();
}
