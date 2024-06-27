part of "../../index.dart";

class ClassicDigestParamsInteractor extends DigestParamsInteractor {
  @override
  ClassicDigestParams get initial => super.initial as ClassicDigestParams;

  const ClassicDigestParamsInteractor(
      {super.key,
      required ClassicDigestParams super.initial,
      super.title = "Digest parameters",
      super.description =
          "Used by digests like sha and keccak. The main parameter is the output size."});

  @override
  ClassicDigestParamsInteractorState createState() =>
      ClassicDigestParamsInteractorState();
}

class ClassicDigestParamsInteractorState
    extends DigestParamsInteractorState<ClassicDigestParamsInteractor> {
  final _key = NamedEnumInteractorKey<ClassicDigestSize>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);

    yield NamedEnumInteractor<ClassicDigestSize>(
        key: _key,
        initial: widget.initial.size,
        title: "Output size",
        description:
            "The length of the resulting output. A higher value implies increased security, but also longer ciphertexts and possibly increased compoting time.",
        values: ClassicDigestSize.values);
  }

  @override
  ClassicDigestParams get current => ClassicDigestParams(
      super.current, _key.currentState?.current ?? widget.initial.size);
}

typedef ClassicDigestParamsInteractorKey
    = InteractorKey<ClassicDigestParamsInteractorState>;
