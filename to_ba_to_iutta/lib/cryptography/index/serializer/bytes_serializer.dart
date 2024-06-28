part of "../index.dart";

class BytesSerializer extends Serializer<Bytes> {
  final IntSerializer _lengthSerializer;
  final IntSerializer _byteSerializer;

  const BytesSerializer(
      [this._lengthSerializer = const IntSerializer(),
      this._byteSerializer = const IntSerializer(intLengthInBytes: 1)]);

  @override
  Stream<Byte> serialize(Bytes input) async* {
    yield* _lengthSerializer.serialize(input.length);
    for (Byte byte in input) {
      yield* _byteSerializer.serialize(byte);
    }
  }

  @override
  Future<Bytes> load(StreamQueue<Byte> input) async {
    final length = await _lengthSerializer.load(input);
    final res = Bytes(length);
    for (int i = 0; i < length; ++i) {
      res[i] = await _byteSerializer.load(input);
    }
    return res;
  }
}
