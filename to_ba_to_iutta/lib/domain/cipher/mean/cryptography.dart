part of "../index.dart";

mixin _CryptographyCipher on Cipher {
  abstract final c.Cipher algorithm;

  @override
  int get keySize => algorithm.secretKeyLength;

  @override
  int get nonceSize => algorithm.nonceLength;

  @override
  Future<Bytes> get newKey async =>
      Bytes.fromList(await (await algorithm.newSecretKey()).extractBytes());

  @override
  Future<Bytes> get newNonce async => Bytes.fromList(algorithm.newNonce());
}
