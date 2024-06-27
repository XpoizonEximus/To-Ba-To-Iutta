part of "../../index.dart";

class HashKdfParamsSerializer extends KdfParamsSerializer {
  final DigestDataSerializer _digestSerializer;

  HashKdfParamsSerializer([DigestDataSerializer? dataSerializer])
      : _digestSerializer = dataSerializer ?? DigestDataSerializer();

  @override
  Stream<Byte> serialize(covariant HashKdfParams input) async* {
    yield* super.serialize(input);
    yield* _digestSerializer.serialize(input.digestData);
  }

  @override
  Future<HashKdfParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);
    return HashKdfParams(underlying, await _digestSerializer.load(input));
  }
}
