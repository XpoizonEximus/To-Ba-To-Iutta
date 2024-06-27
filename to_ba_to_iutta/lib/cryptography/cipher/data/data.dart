part of "../index.dart";

class CipherData extends Data<Cipher, CipherParams> {
  CipherData(CipherImplementation super.implementation, super.params);

  static final defaults = CipherData(CipherImplementation.unauthenticatedBlock,
      CipherImplementation.unauthenticatedBlock.requiredParams.defaults);
}
