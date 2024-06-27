part of "../../../index.dart";

enum AuthenticatedModeOfOperation implements Named {
  gcm("Gallois-Counter Mode"),
  ccm("CTR with CBC-Mac");

  @override
  final String name;

  const AuthenticatedModeOfOperation(this.name);
}

class AuthenticatedBlockCipherParams extends BlockCipherParams {
  final AuthenticatedModeOfOperation moo;

  AuthenticatedBlockCipherParams(this.moo, BlockCipherParams underlying)
      : super.fromParams(underlying);

  AuthenticatedBlockCipherParams.fromParams(
      AuthenticatedBlockCipherParams params)
      : this(params.moo, params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.authenticatedBlock;
}

class AuthenticatedBlockCipherParamsInteractorConverter
    extends BlockCipherParamsInteractorConverter {
  const AuthenticatedBlockCipherParamsInteractorConverter();

  @override
  AuthenticatedBlockCipherParamsInteractor convert(
          covariant AuthenticatedBlockCipherParams params,
          {Key? key}) =>
      AuthenticatedBlockCipherParamsInteractor(key: key, initial: params);
}
