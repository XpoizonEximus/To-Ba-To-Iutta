part of "../index.dart";

class AsymmetricCipherData
    extends Data<AsymmetricCipher, AsymmetricCipherParams> {
  AsymmetricCipherData(
      AsymmetricCipherImplementation super.implementation, super.params);

  static final defaults = AsymmetricCipherData(
      AsymmetricCipherImplementation.rsa,
      AsymmetricCipherImplementation.rsa.requiredParams.defaults);
}
