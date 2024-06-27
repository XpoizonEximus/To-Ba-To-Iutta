part of "../index.dart";

class CipherDataSerializer extends DataSerializer<CipherData> {
  final CipherImplementationSerializer _implementationSerializer;

  CipherDataSerializer(
      [CipherImplementationSerializer? implementationSerializer])
      : _implementationSerializer =
            implementationSerializer ?? CipherImplementationSerializer();

  @override
  Stream<Byte> serialize(CipherData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as CipherImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<CipherData> load(StreamQueue<Byte> input) async {
    final implementation = await _implementationSerializer.load(input);
    final params = await implementation.requiredParams.serializer.load(input);

    return CipherData(implementation, params);
  }
}
