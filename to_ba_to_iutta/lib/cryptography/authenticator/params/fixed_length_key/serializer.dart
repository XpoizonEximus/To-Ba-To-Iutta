part of "../../index.dart";

class FixedLengthKeyAuthenticatorParamsSerializer
    extends AuthenticatorParamsSerializer {
  final KdfDataSerializer _dataSerializer;

  FixedLengthKeyAuthenticatorParamsSerializer(
      [KdfDataSerializer? dataSerializer])
      : _dataSerializer = dataSerializer ?? KdfDataSerializer();

  @override
  Stream<Byte> serialize(
      covariant FixedLengthKeyAuthenticatorParams input) async* {
    yield* super.serialize(input);
    yield* _dataSerializer.serialize(input.kdfData);
  }

  @override
  Future<FixedLengthKeyAuthenticatorParams> load(
      StreamQueue<Byte> input) async {
    final underlying = await super.load(input);
    return FixedLengthKeyAuthenticatorParams(
        underlying, await _dataSerializer.load(input));
  }
}
