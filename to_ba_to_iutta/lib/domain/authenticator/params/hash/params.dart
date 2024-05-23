part of "../../index.dart";

class HashAuthenticatorParams extends AuthenticatorParams {
  final DigestData digestData;

  const HashAuthenticatorParams(this.digestData);

  @override
  AuthenticatorParamsImplementation get implementation =>
      AuthenticatorParamsImplementation.hash;
}

class HashAuthenticatorParamsInteractorConverter
    extends AuthenticatorParamsInteractorConverter {
  const HashAuthenticatorParamsInteractorConverter();

  @override
  HashAuthenticatorParamsInteractor convert(
          covariant HashAuthenticatorParams params,
          {Key? key}) =>
      HashAuthenticatorParamsInteractor(
        key: key,
        initial: params,
        title: params.implementation.name,
      );
}
