part of "../../index.dart";

class ClassicDigestParamsSerializer extends DigestParamsSerializer {
  final EnumSerializer<ClassicDigestSize> _enumSerializer;

  const ClassicDigestParamsSerializer(
      [this._enumSerializer = const EnumSerializer<ClassicDigestSize>(
          ClassicDigestSize.values)]);

  @override
  Stream<Byte> serialize(covariant ClassicDigestParams input) async* {
    yield* super.serialize(input);
    yield* _enumSerializer.serialize(input.size);
  }

  @override
  Future<ClassicDigestParams> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();
    final _ = super.load(broadcastedInput);
    return ClassicDigestParams(await _enumSerializer.load(broadcastedInput));
  }
}
