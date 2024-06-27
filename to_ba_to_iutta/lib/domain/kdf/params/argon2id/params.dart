part of "../../index.dart";

class Argon2IdKdfParams extends KdfParams {
  final int iterations;
  final int memory;
  final int parallelism;

  Argon2IdKdfParams(super.params,
      {required this.iterations,
      required this.memory,
      required this.parallelism})
      : super.fromParams();

  Argon2IdKdfParams.fromParams(Argon2IdKdfParams params)
      : this(params,
            iterations: params.iterations,
            memory: params.memory,
            parallelism: params.parallelism);

  @override
  KdfParamsImplementation get implementation =>
      KdfParamsImplementation.argon2Id;
}

class Argon2IdKdfParamsInteractorConverter
    extends KdfParamsInteractorConverter {
  const Argon2IdKdfParamsInteractorConverter();

  @override
  Argon2IdKdfParamsInteractor convert(covariant Argon2IdKdfParams params,
          {Key? key}) =>
      Argon2IdKdfParamsInteractor(
        key: key,
        initial: params,
      );
}
