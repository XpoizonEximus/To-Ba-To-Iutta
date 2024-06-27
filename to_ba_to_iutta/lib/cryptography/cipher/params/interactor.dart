part of "../index.dart";

class CipherParamsInteractor extends ParamsInteractor<CipherParams> {
  const CipherParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Cipher parameters",
      super.description =
          "These are the general parameters of the cipher. The main one is related to authentication."});

  @override
  CipherParamsInteractorState<CipherParamsInteractor> createState() =>
      CipherParamsInteractorState<CipherParamsInteractor>();
}

class CipherParamsInteractorState<I extends CipherParamsInteractor>
    extends ParamsInteractorState<CipherParams, I> {
  @override
  Iterable<Widget> buildParams(BuildContext context) => [];

  @override
  CipherParams get current => const CipherParams();
}

typedef CipherParamsInteractorKey
    = InteractorKey<CipherParamsInteractorState<CipherParamsInteractor>>;
