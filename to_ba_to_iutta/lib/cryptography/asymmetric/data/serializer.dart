part of "../index.dart";

class AsymmetricCipherDataSerializer extends DataSerializer<AsymmetricCipherData> {
  final AsymmetricCipherImplementationSerializer _implementationSerializer;

  AsymmetricCipherDataSerializer(
      [AsymmetricCipherImplementationSerializer? implementationSerializer])
      : _implementationSerializer =
            implementationSerializer ?? AsymmetricCipherImplementationSerializer();

  @override
  Stream<Byte> serialize(AsymmetricCipherData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as AsymmetricCipherImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<AsymmetricCipherData> load(StreamQueue<Byte> input) async {
    final implementation = await _implementationSerializer.load(input);
    final params = await implementation.requiredParams.serializer.load(input);

    return AsymmetricCipherData(implementation, params);
  }
}
