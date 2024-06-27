part of "../../../index.dart";

class AuthenticatedBlockCipherParamsSerializer
    extends BlockCipherParamsSerializer {
  final EnumSerializer<AuthenticatedModeOfOperation> _mooSerializer;

  const AuthenticatedBlockCipherParamsSerializer(
      [this._mooSerializer = const EnumSerializer<AuthenticatedModeOfOperation>(
          AuthenticatedModeOfOperation.values)]);

  @override
  Future<AuthenticatedBlockCipherParams> load(StreamQueue<Byte> input) async {
    final blockCipherParams = await super.load(input);

    return AuthenticatedBlockCipherParams(
        await _mooSerializer.load(input), blockCipherParams);
  }

  @override
  Stream<Byte> serialize(
      covariant AuthenticatedBlockCipherParams input) async* {
    yield* super.serialize(input);
    yield* _mooSerializer.serialize(input.moo);
  }
}
