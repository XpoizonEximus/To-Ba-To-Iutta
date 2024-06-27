part of "../../index.dart";

class BlakeDigestParamsSerializer extends DigestParamsSerializer {
  final EnumSerializer<BlakeDigestType> _enumSerializer;
  final BoundedIntSerializer? _intSerializer;

  const BlakeDigestParamsSerializer(
      [this._enumSerializer =
          const EnumSerializer<BlakeDigestType>(BlakeDigestType.values),
      this._intSerializer]);

  @override
  Stream<Byte> serialize(covariant BlakeDigestParams input) async* {
    yield* super.serialize(input);
    yield* _enumSerializer.serialize(input.type);
    yield* (_intSerializer ??
            BoundedIntSerializer(
                min: BlakeDigestSize.standardMin,
                max: BlakeDigestSize.standardMax(input.type)))
        .serialize(input._outputSize);
  }

  @override
  Future<BlakeDigestParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);
    final type = await _enumSerializer.load(input);

    return BlakeDigestParams(
        underlying,
        type,
        (await (_intSerializer ??
                    BoundedIntSerializer(
                        min: BlakeDigestSize.standardMin,
                        max: BlakeDigestSize.standardMax(type)))
                .load(input))
            .value);
  }
}
