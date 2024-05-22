part of "../../index.dart";

class BlakeDigestParamsSerializer extends DigestParamsSerializer {
  final EnumSerializer<BlakeType> _enumSerializer;
  final BoundedIntSerializer? _intSerializer;

  const BlakeDigestParamsSerializer(
      [this._enumSerializer = const EnumSerializer<BlakeType>(BlakeType.values),
      this._intSerializer]);

  @override
  Stream<Byte> serialize(covariant BlakeDigestParams input) async* {
    yield* super.serialize(input);
    yield* _enumSerializer.serialize(input.type);
    yield* (_intSerializer ??
            BoundedIntSerializer(
                min: BlakeSize.standardMin,
                max: BlakeSize.standardMax(input.type)))
        .serialize(input.outputSize);
  }

  @override
  Future<BlakeDigestParams> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();
    final _ = super.load(broadcastedInput);

    final type = await _enumSerializer.load(broadcastedInput);

    return BlakeDigestParams(
        BlakeSize(
            (await (_intSerializer ??
                        BoundedIntSerializer(
                            min: BlakeSize.standardMin,
                            max: BlakeSize.standardMax(type)))
                    .load(broadcastedInput))
                .value,
            type),
        type);
  }
}
