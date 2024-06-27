part of "../../../index.dart";

enum UnauthenticatedModeOfOperation implements Named {
  cbc("Cipher Block Chaining"),
  cfb64("Ciphertext feedback (8-bytes blocks)"),
  ofb64("Output feedback (8-bytes blocks)"),
  ige("Infinite Garble Expansion");

  @override
  final String name;

  const UnauthenticatedModeOfOperation(this.name);
}

class UnauthenticatedBlockCipherParams extends BlockCipherParams {
  final AuthenticatorData authenticatorData;
  final UnauthenticatedModeOfOperation moo;

  UnauthenticatedBlockCipherParams(
      this.authenticatorData, this.moo, BlockCipherParams underlying)
      : super.fromParams(underlying);

  UnauthenticatedBlockCipherParams.fromParams(
      UnauthenticatedBlockCipherParams params)
      : this(params.authenticatorData, params.moo, params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.unauthenticatedBlock;
}

class UnauthenticatedBlockCipherParamsInteractorConverter
    extends BlockCipherParamsInteractorConverter {
  const UnauthenticatedBlockCipherParamsInteractorConverter();

  @override
  UnauntenticatedBlockCipherParamsInteractor convert(
          covariant UnauthenticatedBlockCipherParams params,
          {Key? key}) =>
      UnauntenticatedBlockCipherParamsInteractor(
          key: key, initial: params);
}
