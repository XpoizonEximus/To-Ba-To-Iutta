part of "../index.dart";

class DigestParamsInteractor<T extends DigestParams>
    extends ParamsInteractor<T> {
  const DigestParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest parameters",
      super.description =
          "This type of digest does not have adjustable parameters."});

  @override
  DigestParamsInteractorState<T, DigestParamsInteractor<T>> createState() =>
      DigestParamsInteractorState<T, DigestParamsInteractor<T>>();
}

class DigestParamsInteractorState<T extends DigestParams,
    I extends DigestParamsInteractor> extends ParamsInteractorState<T, I> {
  @override
  Widget buildContent(BuildContext context) => const SizedBox.shrink();
}

typedef DigestParamsInteractorKey<T extends DigestParams>
    = InteractorKey<DigestParamsInteractorState<T, DigestParamsInteractor>>;
