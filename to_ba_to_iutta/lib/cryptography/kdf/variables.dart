part of "index.dart";

class KdfVariables extends Variables {
  final int size;
  final Bytes nonce;

  KdfVariables({required this.size, required this.nonce});
}
