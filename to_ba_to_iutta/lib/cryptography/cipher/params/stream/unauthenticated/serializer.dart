part of "../../../index.dart";

class UnauthenticatedStreamCipherParamsSerializer
    extends StreamCipherParamsSerializer {
  final AuthenticatorDataSerializer _authenticatorSerializer;
  final EnumSerializer<UnauthenticatedStreamEngine> _engineSerializer;
  final IntSerializer _roundsSerializer;

  UnauthenticatedStreamCipherParamsSerializer(
      [AuthenticatorDataSerializer? authenticatorDataSerializer,
      this._engineSerializer =
          const EnumSerializer<UnauthenticatedStreamEngine>(
              UnauthenticatedStreamEngine.values),
      this._roundsSerializer = const IntSerializer()])
      : _authenticatorSerializer =
            authenticatorDataSerializer ?? AuthenticatorDataSerializer();

  @override
  Stream<Byte> serialize(UnauthenticatedStreamCipherParams input) async* {
    yield* super.serialize(input);
    yield* _authenticatorSerializer.serialize(input.authenticatorData);
    yield* _engineSerializer.serialize(input.engine);
    yield* _roundsSerializer.serialize(input.rounds);
  }

  @override
  Future<UnauthenticatedStreamCipherParams> load(
      StreamQueue<Byte> input) async {
    final streamCipherParams = await super.load(input);
    final authenticatorData = await _authenticatorSerializer.load(input);
    final engine = await _engineSerializer.load(input);
    final rounds = await _roundsSerializer.load(input);

    return UnauthenticatedStreamCipherParams(
        authenticatorData, engine, rounds, streamCipherParams);
  }
}
