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
  Future<AuthenticatorData> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();

    final implementation =
        await _implementationSerializer.load(broadcastedInput);
    final params =
        await implementation.requiredParams.serializer.load(broadcastedInput);

    return AuthenticatorData(implementation, params);
  }
}
