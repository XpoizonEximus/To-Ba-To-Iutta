part of "../index.dart";

class AuthenticatorDataSerializer extends DataSerializer<AuthenticatorData> {
  final AuthenticatorImplementationSerializer _implementationSerializer;

  AuthenticatorDataSerializer(
      [AuthenticatorImplementationSerializer? implementationSerializer])
      : _implementationSerializer =
            implementationSerializer ?? AuthenticatorImplementationSerializer();

  @override
  Stream<Byte> serialize(AuthenticatorData input) async* {
    yield* _implementationSerializer
        .serialize(input.implementation as AuthenticatorImplementation);
    yield* input.implementation.requiredParams.serializer
        .serialize(input.params);
  }

  @override
  Future<AuthenticatorData> load(StreamQueue<Byte> input) async {
    final implementation = await _implementationSerializer.load(input);
    final params = await implementation.requiredParams.serializer.load(input);

    return AuthenticatorData(implementation, params);
  }
}
