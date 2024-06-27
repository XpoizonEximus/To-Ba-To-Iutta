part of "../../index.dart";

mixin _PointyCastleBlockCipher on _PointyCastleCipher, BlockCipher {
  abstract final pc.BlockCipher algorithm;
  @override
  int get nonceSize => algorithm.blockSize;
  @override
  int get blockSize => algorithm.blockSize;
  @override
  int get keySize => blockSize;

  @override
  Future<Bytes> get newKey => SecureBytesGenerator(keySize).get;
  @override
  Future<Bytes> get newNonce => SecureBytesGenerator(nonceSize).get;
}
