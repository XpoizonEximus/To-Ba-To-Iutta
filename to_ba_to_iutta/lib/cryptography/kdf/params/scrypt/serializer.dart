part of "../../index.dart";

class ScryptKdfParamsSerializer extends KdfParamsSerializer {
  final IntSerializer _intSerializer;

  const ScryptKdfParamsSerializer(
      [this._intSerializer = const IntSerializer()]);

  @override
  Stream<Byte> serialize(covariant ScryptKdfParams input) async* {
    yield* super.serialize(input);

    yield* _intSerializer.serialize(input.costFactorExponent);
    yield* _intSerializer.serialize(input.blockSizeFactor);
    yield* _intSerializer.serialize(input.parallelisationFactor);
  }

  @override
  Future<ScryptKdfParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);

    final costFactorExponent = await _intSerializer.load(input);
    final blockSizeFactor = await _intSerializer.load(input);
    final parallelisationFactor = await _intSerializer.load(input);

    return ScryptKdfParams(underlying,
        costFactorExponent: costFactorExponent,
        blockSizeFactor: blockSizeFactor,
        parallelisationFactor: parallelisationFactor);
  }
}
