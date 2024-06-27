part of "../../index.dart";

class StreamCipherParams extends CipherParams {

  StreamCipherParams(super.underlying)
      : super.fromParams();
  StreamCipherParams.fromParams(StreamCipherParams params)
      : this(params);

  @override
  CipherParamsImplementation get implementation =>
      CipherParamsImplementation.stream;
}

class StreamCipherParamsInteractorConverter
    extends CipherParamsInteractorConverter {
  const StreamCipherParamsInteractorConverter();

  @override
  StreamCipherParamsInteractor convert(covariant StreamCipherParams params,
          {Key? key}) =>
      StreamCipherParamsInteractor(key: key, initial: params);
}
