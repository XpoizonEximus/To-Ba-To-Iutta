part of "../index.dart";

class KdfDataSerializer extends DataSerializer<KdfData> {
  final KdfImplementationSerializer _implementationSerializer;

  KdfDataSerializer(
      [KdfImplementationSerializer? implementationSerializer])
      : _implementationSerializer =
            implementationSerializer ?? KdfImplementationSerializer();

  @override
  Stream<Byte> serialize(KdfData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as KdfImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<KdfData> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();

    final implementation =
        await _implementationSerializer.load(broadcastedInput);
    final params =
        await implementation.requiredParams.serializer.load(broadcastedInput);

    return KdfData(implementation, params);
  }
}
