part of "../index.dart";

class CipherParamsSerializer extends ParamsSerializer<CipherParams> {
  const CipherParamsSerializer();

  @override
  Future<CipherParams> load(StreamQueue<Byte> input) =>
      Future.value(const CipherParams());

  @override
  Stream<Byte> serialize(CipherParams input) => const Stream.empty();
}
