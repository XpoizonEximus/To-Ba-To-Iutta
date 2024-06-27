part of "index.dart";

class AuthenticatorVariables extends Variables {
  final Bytes key;
  final Bytes nonce;

  AuthenticatorVariables({required this.key, required this.nonce});
}
