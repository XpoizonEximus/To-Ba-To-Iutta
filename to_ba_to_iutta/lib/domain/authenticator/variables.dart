part of "index.dart";

class AuthenticatorVariables extends Variables {
  final Bytes key;
  final Bytes nonce;

  AuthenticatorVariables({required this.key, Bytes? nonce})
      : nonce = nonce ?? Bytes.fromList([]);
}

class AuthenticatorVariablesSerializer
    extends VariablesSerializer<AuthenticatorVariables> {
  final BytesSerializer _bytesSerializer;

  const AuthenticatorVariablesSerializer(
      [this._bytesSerializer = const BytesSerializer()]);

  @override
  Stream<Byte> serialize(AuthenticatorVariables input) async* {
    yield* _bytesSerializer.serialize(input.key);
    yield* _bytesSerializer.serialize(input.nonce);
  }

  @override
  Future<AuthenticatorVariables> load(Stream<Byte> input) async {
    final broadcastedInput = input.asBroadcastStream();
    final Bytes key = await _bytesSerializer.load(broadcastedInput);
    final Bytes nonce = await _bytesSerializer.load(broadcastedInput);
    return AuthenticatorVariables(key: key, nonce: nonce);
  }
}
