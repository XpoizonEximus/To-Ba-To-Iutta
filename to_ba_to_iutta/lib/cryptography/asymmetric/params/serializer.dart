part of "../index.dart";

class AsymmetricCipherParamsSerializer
    extends ParamsSerializer<AsymmetricCipherParams> {
  final EnumSerializer<AsymmetricCipherEngine> _engineSerializer;
  final EnumSerializer<AsymmetricEncoding> _encodingSerializer;
  const AsymmetricCipherParamsSerializer(
      [this._engineSerializer = const EnumSerializer<AsymmetricCipherEngine>(
          AsymmetricCipherEngine.values),
      this._encodingSerializer =
          const EnumSerializer<AsymmetricEncoding>(AsymmetricEncoding.values)]);

  @override
  Future<AsymmetricCipherParams> load(StreamQueue<Byte> input) async =>
      AsymmetricCipherParams(await _engineSerializer.load(input),
          await _encodingSerializer.load(input));

  @override
  Stream<Byte> serialize(AsymmetricCipherParams input) async* {
    yield* _engineSerializer.serialize(input.engine);
    yield* _encodingSerializer.serialize(input.encoding);
  }
}
