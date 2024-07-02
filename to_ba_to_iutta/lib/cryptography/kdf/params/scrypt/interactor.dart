part of "../../index.dart";

class ScryptKdfParamsInteractor extends KdfParamsInteractor {
  @override
  ScryptKdfParams get initial => super.initial as ScryptKdfParams;

  const ScryptKdfParamsInteractor(
      {super.key,
      required ScryptKdfParams super.initial,
      super.title = "Scrypt parameters",
      super.description = "Used by the Scrypt KDF."});

  @override
  ScryptKdfParamsInteractorState createState() =>
      ScryptKdfParamsInteractorState();
}

class ScryptKdfParamsInteractorState
    extends KdfParamsInteractorState<ScryptKdfParamsInteractor> {
  final _costFactorExponentKey = IntInteractorKey();
  final _blockSizeFactorKey = IntInteractorKey();
  final _parallelisationFactorKey = IntInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield IntInteractor(
      key: _costFactorExponentKey,
      initial: (initial as ScryptKdfParams).costFactorExponent,
      title: "Cost factor",
      description:
          "Dictates the overall computational and memory effort required, enhancing resistance against brute-force attacks.",
      unitOfMeasure: '2 ^',
      unitOfMeasureInFront: true,
    );
    yield IntInteractor(
      key: _blockSizeFactorKey,
      initial: (initial as ScryptKdfParams).blockSizeFactor,
      title: "Block Size Factor",
      description:
          "Adjusts the memory usage and internal parallelism, impacting the function's performance and security.",
      unitOfMeasure: 'x',
      unitOfMeasureInFront: true,
    );
    yield IntInteractor(
      key: _parallelisationFactorKey,
      initial: (initial as ScryptKdfParams).parallelisationFactor,
      title: "Parallelization Factor",
      description:
          "Sets the number of parallel threads, influencing the function's speed and ability to utilize multi-core processors.",
      unitOfMeasure: 'threads',
    );
  }

  @override
  ScryptKdfParams get current => ScryptKdfParams(super.current,
      costFactorExponent: _costFactorExponentKey.currentState!.current,
      blockSizeFactor: _blockSizeFactorKey.currentState!.current,
      parallelisationFactor: _parallelisationFactorKey.currentState!.current);
}

typedef ScryptKdfParamsInteractorKey
    = InteractorKey<ScryptKdfParamsInteractorState>;
