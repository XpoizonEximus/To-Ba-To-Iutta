part of "../../../index.dart";

class UnauthenticatedBlockCipherParamsSerializer
    extends BlockCipherParamsSerializer {
  final AuthenticatorDataSerializer _authenticatorSerializer;
  final EnumSerializer<UnauthenticatedModeOfOperation> _mooSerializer;

  UnauthenticatedBlockCipherParamsSerializer(
      [AuthenticatorDataSerializer? authenticatorDataSerializer,
      this._mooSerializer =
          const EnumSerializer<UnauthenticatedModeOfOperation>(
              UnauthenticatedModeOfOperation.values)])
      : _authenticatorSerializer =
            authenticatorDataSerializer ?? AuthenticatorDataSerializer();

  @override
  Stream<Byte> serialize(UnauthenticatedBlockCipherParams input) async* {
    yield* super.serialize(input);
    yield* _authenticatorSerializer.serialize(input.authenticatorData);
    yield* _mooSerializer.serialize(input.moo);
  }

  @override
  Future<UnauthenticatedBlockCipherParams> load(StreamQueue<Byte> input) async {
    final blockCipherParams = await super.load(input);
    final authenticatorData = await _authenticatorSerializer.load(input);
    final moo = await _mooSerializer.load(input);

    return UnauthenticatedBlockCipherParams(
        authenticatorData, moo, blockCipherParams);
  }
}
