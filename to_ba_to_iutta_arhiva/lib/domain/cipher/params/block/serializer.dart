part of "../../index.dart";

class BlockCipherParamsSerializer extends CipherParamsSerializer {
  final EnumSerializer<BlockCipherEngine> _engineSerializer;

  const BlockCipherParamsSerializer(
      [this._engineSerializer =
          const EnumSerializer<BlockCipherEngine>(BlockCipherEngine.values)]);

  @override
  Stream<Byte> serialize(covariant BlockCipherParams input) async* {
    yield* super.serialize(input);
    yield* _engineSerializer.serialize(input.engine);
  }

  @override
  Future<BlockCipherParams> load(StreamQueue<Byte> input) async {
    final cipherParams = await super.load(input);
    final engine = await _engineSerializer.load(input);

    return BlockCipherParams(engine, cipherParams);
  }
}
