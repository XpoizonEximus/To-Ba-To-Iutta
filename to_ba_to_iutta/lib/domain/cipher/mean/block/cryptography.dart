part of "../../index.dart";

mixin _CryptographyBlockCipher on _CryptographyCipher, BlockCipher {
  @override
  int get blockSize => algorithm.secretKeyLength;
}
