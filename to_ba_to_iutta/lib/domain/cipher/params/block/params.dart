part of "../../index.dart";

enum BlockCipherEngine implements Named {
  aes("Advanced Encryption Standard");

  @override
  final String name;

  const BlockCipherEngine(this.name);
}

class BlockCipherParams extends CipherParams {
  final BlockCipherEngine engine;

  BlockCipherParams(this.engine, CipherParams underlying)
      : super.fromParams(underlying);
  BlockCipherParams.fromParams(BlockCipherParams params)
      : this(params.engine, params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.block;
}

class BlockCipherParamsInteractorConverter
    extends CipherParamsInteractorConverter {
  const BlockCipherParamsInteractorConverter();

  @override
  BlockCipherParamsInteractor convert(covariant BlockCipherParams params,
          {Key? key}) =>
      BlockCipherParamsInteractor(
          key: key, initial: params);
}
