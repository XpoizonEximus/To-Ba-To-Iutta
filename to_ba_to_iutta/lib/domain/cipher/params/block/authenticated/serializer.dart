part of "../../../index.dart";

class AuthenticatedBlockCipherParamsSerializer
    extends BlockCipherParamsSerializer {
  final EnumSerializer<AuthenticatedModeOfOperation> _mooSerializer;

  const AuthenticatedBlockCipherParamsSerializer(
      [AuthenticatorDataSerializer? authenticatorDataSerializer,
      this._mooSerializer = const EnumSerializer<AuthenticatedModeOfOperation>(
          AuthenticatedModeOfOperation.values)]);

  @override
  Stream<Byte> serialize(AuthenticatedBlockCipherParams input) async* {
    yield* super.serialize(input);
    yield* _mooSerializer.serialize(input.moo);
  }

  @override
  Future<AuthenticatedBlockCipherParams> load(StreamQueue<Byte> input) async {
    final blockCipherParams = await super.load(input);
    final moo = await _mooSerializer.load(input);

    return AuthenticatedBlockCipherParams(moo, blockCipherParams);
  }
}
