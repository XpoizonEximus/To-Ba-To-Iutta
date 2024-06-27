part of "../index.dart";

class KdfParamsInteractor extends ParamsInteractor<KdfParams> {
  const KdfParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Kdf parameters",
      super.description = "The generic kdf parameters address nonce length."});

  @override
  KdfParamsInteractorState<KdfParamsInteractor> createState() =>
      KdfParamsInteractorState<KdfParamsInteractor>();
}

class KdfParamsInteractorState<I extends KdfParamsInteractor>
    extends ParamsInteractorState<KdfParams, I> {
  final _nonceSizeKey = IntInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield IntInteractor(
        key: _nonceSizeKey,
        initial: widget.initial.nonceSize,
        title: "Nonce size",
        description:
            "The derivation process requires the generation of a new random list of bytes every time. Here specify the size of this list.",
        unitOfMeasure: "bytes");
  }

  @override
  KdfParams get current => KdfParams(
      _nonceSizeKey.currentState?.current ?? widget.initial.nonceSize);
}

typedef KdfParamsInteractorKey
    = InteractorKey<KdfParamsInteractorState<KdfParamsInteractor>>;
