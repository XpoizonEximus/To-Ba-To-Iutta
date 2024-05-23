part of "../../index.dart";

class HashAuthenticatorParamsSerializer extends AuthenticatorParamsSerializer {
  final DigestDataSerializer _dataSerializer;

  const HashAuthenticatorParamsSerializer(
      [this._dataSerializer = const DigestDataSerializer()]);

  @override
  Stream<Byte> serialize(covariant HashAuthenticatorParams input) async* {
    yield* super.serialize(input);
    yield* _dataSerializer.serialize(input.digestData);
  }

  @override
  Future<HashAuthenticatorParams> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();
    final _ = super.load(broadcastedInput);
    return HashAuthenticatorParams(
        await _dataSerializer.load(broadcastedInput));
  }
}
