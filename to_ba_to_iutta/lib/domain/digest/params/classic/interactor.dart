part of "../../index.dart";

class ClassicDigestParamsInteractor
    extends DigestParamsInteractor<ClassicDigestParams> {
  const ClassicDigestParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest parameters",
      super.description =
          "Used by digests like sha and keccak. The main parameter is the output size."});

  @override
  ClassicDigestParamsInteractorState createState() =>
      ClassicDigestParamsInteractorState();
}

class ClassicDigestParamsInteractorState extends DigestParamsInteractorState<
    ClassicDigestParams, ClassicDigestParamsInteractor> {
  final _key = NamedEnumInteractorKey<ClassicDigestSize>();

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.buildContent(context),
        NamedEnumInteractor<ClassicDigestSize>(
            key: _key,
            initial: widget.initial.size,
            title: "Output size",
            description:
                "The length of the resulting output. A higher value implies increased security, but also longer ciphertexts and possibly increased compoting time.",
            values: ClassicDigestSize.values)
      ],
    );
  }

  @override
  ClassicDigestParams get current =>
      ClassicDigestParams(_key.currentState?.current ?? widget.initial.size);
}

typedef ClassicDigestParamsInteractorKey
    = InteractorKey<ClassicDigestParamsInteractorState>;
