part of "../../index.dart";

class HashAuthenticatorParamsSerializer extends AuthenticatorParamsSerializer {
  final DigestDataSerializer _dataSerializer;

  HashAuthenticatorParamsSerializer([DigestDataSerializer? dataSerializer])
      : _dataSerializer = dataSerializer ?? DigestDataSerializer();

  @override
  Stream<Byte> serialize(covariant HashAuthenticatorParams input) async* {
    yield* super.serialize(input);
    yield* _dataSerializer.serialize(input.digestData);
  }

  @override
  Future<HashAuthenticatorParams> load(StreamQueue<Byte> input) async {
    final underlying = await super.load(input);
    return HashAuthenticatorParams(
        underlying, await _dataSerializer.load(input));
  }
}
