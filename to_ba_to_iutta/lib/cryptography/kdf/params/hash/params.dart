part of "../../index.dart";

class HashKdfParams extends KdfParams {
  final DigestData digestData;

  HashKdfParams(super.params, this.digestData) : super.fromParams();
  HashKdfParams.fromParams(HashKdfParams params)
      : this(params, params.digestData);

  @override
  KdfParamsImplementation get implementation => KdfParamsImplementation.hash;
}

class HashKdfParamsInteractorConverter extends KdfParamsInteractorConverter {
  const HashKdfParamsInteractorConverter();

  @override
  HashKdfParamsInteractor convert(covariant HashKdfParams params, {Key? key}) =>
      HashKdfParamsInteractor(
        key: key,
        initial: params,
      );
}
