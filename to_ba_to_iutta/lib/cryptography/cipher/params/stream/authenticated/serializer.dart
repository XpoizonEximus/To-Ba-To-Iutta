part of "../../../index.dart";

class AuthenticatedStreamCipherParamsSerializer
    extends StreamCipherParamsSerializer {
  final EnumSerializer<AuthenticatedStreamEngine> _engineSerializer;

  const AuthenticatedStreamCipherParamsSerializer(
      [AuthenticatorDataSerializer? authenticatorDataSerializer,
      this._engineSerializer = const EnumSerializer<AuthenticatedStreamEngine>(
          AuthenticatedStreamEngine.values)]);

  @override
  Stream<Byte> serialize(AuthenticatedStreamCipherParams input) async* {
    yield* super.serialize(input);
    yield* _engineSerializer.serialize(input.engine);
  }

  @override
  Future<AuthenticatedStreamCipherParams> load(StreamQueue<Byte> input) async {
    final streamCipherParams = await super.load(input);
    final engine = await _engineSerializer.load(input);

    return AuthenticatedStreamCipherParams(engine, streamCipherParams);
  }
}
