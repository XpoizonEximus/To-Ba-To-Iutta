part of "../../index.dart";

class ClassicDigestParamsSerializer extends DigestParamsSerializer {
  final EnumSerializer<ClassicDigestSize> _enumSerializer;

  const ClassicDigestParamsSerializer(
      [this._enumSerializer =
          const EnumSerializer<ClassicDigestSize>(ClassicDigestSize.values)]);

  @override
  Stream<Byte> serialize(covariant ClassicDigestParams input) async* {
    yield* super.serialize(input);
    yield* _enumSerializer.serialize(input.size);
  }

  @override
  Future<ClassicDigestParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);
    return ClassicDigestParams(underlying, await _enumSerializer.load(input));
  }
}
