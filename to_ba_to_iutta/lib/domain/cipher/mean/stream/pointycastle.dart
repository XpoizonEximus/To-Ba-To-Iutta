part of "../../index.dart";

mixin _PointyCastleStreamCipher on _PointyCastleCipher, StreamCipher {
  abstract final pc.StreamCipher algorithm;

  @override
  Future<Bytes> get newKey => SecureBytesGenerator(keySize).get;
  @override
  Future<Bytes> get newNonce => SecureBytesGenerator(nonceSize).get;
}
