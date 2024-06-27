part of "../../index.dart";

class Argon2IdKdfParamsInteractor extends KdfParamsInteractor {
  @override
  Argon2IdKdfParams get initial => super.initial as Argon2IdKdfParams;
  const Argon2IdKdfParamsInteractor(
      {super.key,
      required Argon2IdKdfParams super.initial,
      super.title = "Argon2id parameters",
      super.description = "Used by the Argon2id KDF."});

  @override
  Argon2IdKdfParamsInteractorState createState() =>
      Argon2IdKdfParamsInteractorState();
}

class Argon2IdKdfParamsInteractorState
    extends KdfParamsInteractorState<Argon2IdKdfParamsInteractor> {
  final _iterationsKey = IntInteractorKey();
  final _memoryKey = IntInteractorKey();
  final _parallelismKey = IntInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield IntInteractor(
      key: _iterationsKey,
      initial: widget.initial.iterations,
      title: "Number of iterations",
      description:
          "This parameter dictates how many times the memory is filled and then iterated over, affecting the time cost of the algorithm and the security.",
      unitOfMeasure: 'times',
    );
    yield IntInteractor(
      key: _memoryKey,
      initial: widget.initial.memory,
      title: "Memory used",
      description:
          "This parameter determines how much memory (RAM) the algorithm will use, contributing to its resistance against brute-force attacks and memory-hard functions.",
      unitOfMeasure: 'KB',
    );
    yield IntInteractor(
      key: _parallelismKey,
      initial: widget.initial.parallelism,
      title: "Number of iterations",
      description:
          "This parameter specifies how many threads will be used to parallelize the computation, affecting the time cost and leveraging modern multi-core processors.",
      unitOfMeasure: 'threads',
    );
  }

  @override
  Argon2IdKdfParams get current => Argon2IdKdfParams(super.current,
      iterations:
          _iterationsKey.currentState?.current ?? widget.initial.iterations,
      memory: _memoryKey.currentState?.current ?? widget.initial.memory,
      parallelism:
          _parallelismKey.currentState?.current ?? widget.initial.parallelism);
}

typedef Argon2IdKdfParamsInteractorKey
    = InteractorKey<Argon2IdKdfParamsInteractorState>;
