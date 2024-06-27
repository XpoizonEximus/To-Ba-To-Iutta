part of "../../index.dart";

class Argon2IdKdfParamsSerializer extends KdfParamsSerializer {
  final IntSerializer _intSerializer;

  const Argon2IdKdfParamsSerializer(
      [this._intSerializer = const IntSerializer()]);

  @override
  Stream<Byte> serialize(covariant Argon2IdKdfParams input) async* {
    yield* super.serialize(input);

    yield* _intSerializer.serialize(input.iterations);
    yield* _intSerializer.serialize(input.memory);
    yield* _intSerializer.serialize(input.parallelism);
  }

  @override
  Future<Argon2IdKdfParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);

    final iterations = await _intSerializer.load(input);
    final memory = await _intSerializer.load(input);
    final parallelism = await _intSerializer.load(input);

    return Argon2IdKdfParams(underlying,
        iterations: iterations, memory: memory, parallelism: parallelism);
  }
}
