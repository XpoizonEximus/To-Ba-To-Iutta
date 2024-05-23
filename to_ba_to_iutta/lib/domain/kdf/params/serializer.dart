part of "../index.dart";

class KdfParamsSerializer extends ParamsSerializer<KdfParams> {
  const KdfParamsSerializer();

  @override
  Future<KdfParams> load(Stream<Byte> input) =>
      Future<KdfParams>.value(const KdfParams());

  @override
  Stream<Byte> serialize(KdfParams input) => const Stream.empty();
}
