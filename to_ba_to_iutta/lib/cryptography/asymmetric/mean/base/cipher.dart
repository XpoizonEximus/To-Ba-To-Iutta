part of "../../index.dart";

abstract class AsymmetricCipher extends Mean {
  const AsymmetricCipher(AsymmetricCipherParams super.params);

  @override
  AsymmetricCipherData get data;

  Stream<Bytes> encrypt(
      StreamQueue<Bytes> input, AsymmetricCipherVariables variables);
  Stream<Bytes> decrypt(
      StreamQueue<Bytes> input, AsymmetricCipherVariables variables);

  Future<AsymmetricCipherVariables> get newKey;
}
