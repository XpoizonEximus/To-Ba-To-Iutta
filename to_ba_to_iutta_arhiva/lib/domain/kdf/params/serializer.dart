part of "../index.dart";

class KdfParamsSerializer extends ParamsSerializer<KdfParams> {
  final IntSerializer _nonceSizeSerializer;

  const KdfParamsSerializer(
      [this._nonceSizeSerializer = const IntSerializer()]);

  @override
  Future<KdfParams> load(StreamQueue<Byte> input) async =>
      KdfParams(await _nonceSizeSerializer.load(input));

  @override
  Stream<Byte> serialize(KdfParams input) =>
      _nonceSizeSerializer.serialize(input.nonceSize);
}
