part of "index.dart";

class KdfVariables extends Variables {
  final Bytes nonce;

  KdfVariables(this.nonce);
}

class KdfVariablesSerializer extends VariablesSerializer<KdfVariables> {
  final BytesSerializer _bytesSerializer;

  const KdfVariablesSerializer(
      [this._bytesSerializer = const BytesSerializer()]);

  @override
  Stream<Byte> serialize(KdfVariables input) =>
      _bytesSerializer.serialize(input.nonce);

  @override
  Future<KdfVariables> load(Stream<Byte> input) async {
    final Bytes nonce = await _bytesSerializer.load(input);
    return KdfVariables(nonce);
  }
}
