part of "../../index.dart";

enum ClassicDigestSize implements Named {
  x224(224 ~/ 8),
  x256(256 ~/ 8),
  x384(384 ~/ 8),
  x512(512 ~/ 8);

  final int outputSize;

  const ClassicDigestSize(this.outputSize);

  @override
  String get name => "$outputSize bytes (${outputSize * 8} bits)";
}

class ClassicDigestParams extends DigestParams {
  final ClassicDigestSize size;

  const ClassicDigestParams(this.size);

  @override
  DigestParamsImplementation get implementation =>
      DigestParamsImplementation.classic;
}

class ClassicDigestParamsInteractorConverter
    extends DigestParamsInteractorConverter {
  const ClassicDigestParamsInteractorConverter();

  @override
  ClassicDigestParamsInteractor convert(covariant ClassicDigestParams params,
      {Key? key}) {
    return ClassicDigestParamsInteractor(
      key: key,
      initial: params,
      title: params.implementation.name,
    );
  }
}
