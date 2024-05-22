part of "../index.dart";

class DigestDataSerializer extends DataSerializer<DigestData> {
  final DigestImplementationSerializer _implementationSerializer;

  const DigestDataSerializer(
      [this._implementationSerializer =
          const DigestImplementationSerializer()]);

  @override
  Stream<Byte> serialize(DigestData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as DigestImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<DigestData> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();

    final implementation =
        await _implementationSerializer.load(broadcastedInput);
    final params =
        await implementation.requiredParams.serializer.load(broadcastedInput);

    return DigestData(implementation, params);
  }
}
