part of "index.dart";

class CipherVariables extends Variables {
  final Bytes key;
  final Bytes nonce;

  CipherVariables({required this.key, required this.nonce});
}
