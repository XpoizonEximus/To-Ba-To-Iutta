part of "../index.dart";

abstract class Cipher extends Mean {
  const Cipher(CipherParams super.params);

  @override
  CipherData get data;

  Stream<Bytes> encrypt(StreamQueue<Bytes> input, CipherVariables variables);
  Stream<Bytes> decrypt(StreamQueue<Bytes> input, CipherVariables variables);

  int get keySize;
  Future<Bytes> get newKey;

  int get nonceSize;
  Future<Bytes> get newNonce;
}
