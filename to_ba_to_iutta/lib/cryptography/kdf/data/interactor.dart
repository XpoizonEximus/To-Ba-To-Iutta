part of "../index.dart";

class KdfDataInteractor extends DataInteractor<KdfData> {
  const KdfDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Key derivation function data",
      super.description =
          "Select the implementation wanted for the kdf algorithm and its parameters."});

  @override
  KdfDataInteractorState createState() => KdfDataInteractorState();
}

class KdfDataInteractorState
    extends DataInteractorState<KdfData, KdfDataInteractor> {
  final _implementationKey = KdfImplementationInteractorKey();
  final _paramsKey = KdfParamsInteractorKey();

  @override
  KdfImplementationInteractor buildImplementation(BuildContext context) =>
      KdfImplementationInteractor(
        key: _implementationKey,
        initial: implementation as KdfImplementation,
        onChanged: changeImplementation,
      );

  @override
  ParamsInteractor buildParams(BuildContext context) =>
      implementation.requiredParams.interactor(params, key: _paramsKey);

  @override
  KdfData get current => KdfData(_implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef KdfDataInteractorKey<T extends KdfData>
    = InteractorKey<KdfDataInteractorState>;
