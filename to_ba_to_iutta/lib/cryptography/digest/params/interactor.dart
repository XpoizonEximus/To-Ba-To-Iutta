part of "../index.dart";

class DigestParamsInteractor extends ParamsInteractor<DigestParams> {
  const DigestParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest parameters",
      super.description =
          "This type of digest does not have adjustable parameters."});

  @override
  DigestParamsInteractorState<DigestParamsInteractor> createState() =>
      DigestParamsInteractorState<DigestParamsInteractor>();
}

class DigestParamsInteractorState<I extends DigestParamsInteractor>
    extends ParamsInteractorState<DigestParams, I> {
  @override
  Iterable<Widget> buildParams(BuildContext context) => [];

  @override
  DigestParams get current => const DigestParams();
}

typedef DigestParamsInteractorKey
    = InteractorKey<DigestParamsInteractorState<DigestParamsInteractor>>;
