part of "../index.dart";

class KdfParamsInteractor<T extends KdfParams>
    extends ParamsInteractor<T> {
  const KdfParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Kdf parameters",
      super.description =
          "This type of Kdf does not have adjustable parameters."});

  @override
  KdfParamsInteractorState<T, KdfParamsInteractor<T>> createState() =>
      KdfParamsInteractorState<T, KdfParamsInteractor<T>>();
}

class KdfParamsInteractorState<T extends KdfParams,
    I extends KdfParamsInteractor> extends ParamsInteractorState<T, I> {
  @override
  Widget buildContent(BuildContext context) => const SizedBox.shrink();
}

typedef KdfParamsInteractorKey<T extends KdfParams>
    = InteractorKey<KdfParamsInteractorState<T, KdfParamsInteractor>>;