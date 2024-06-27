part of "../index.dart";

class AuthenticatorParamsSerializer
    extends ParamsSerializer<AuthenticatorParams> {
  const AuthenticatorParamsSerializer();

  @override
  Future<AuthenticatorParams> load(StreamQueue<Byte> input) =>
      Future<AuthenticatorParams>.value(const AuthenticatorParams());

  @override
  Stream<Byte> serialize(AuthenticatorParams input) => const Stream.empty();
}
