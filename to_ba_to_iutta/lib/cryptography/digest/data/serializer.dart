part of "../index.dart";

class DigestDataSerializer extends DataSerializer<DigestData> {
  final DigestImplementationSerializer _implementationSerializer;

  DigestDataSerializer(
      [DigestImplementationSerializer? implementationSerializer])
      : _implementationSerializer =
            implementationSerializer ?? DigestImplementationSerializer();

  @override
  Stream<Byte> serialize(DigestData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as DigestImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<DigestData> load(StreamQueue<Byte> input) async {
    final implementation = await _implementationSerializer.load(input);
    final params = await implementation.requiredParams.serializer.load(input);

    return DigestData(implementation, params);
  }
}
