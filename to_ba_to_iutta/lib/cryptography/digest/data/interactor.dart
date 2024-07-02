part of "../index.dart";

class DigestDataInteractor extends DataInteractor<DigestData> {
  const DigestDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Digest data",
      super.description =
          "Select the implementation to be used for the digest algorithm and its parameters."});

  @override
  DigestDataInteractorState createState() => DigestDataInteractorState();
}

class DigestDataInteractorState
    extends DataInteractorState<DigestData, DigestDataInteractor> {
  final _paramsKey = DigestParamsInteractorKey();
  final _implementationKey = DigestImplementationInteractorKey();

  @override
  DigestImplementationInteractor buildImplementation(BuildContext context) =>
      DigestImplementationInteractor(
        key: _implementationKey,
        initial: implementation as DigestImplementation,
        onChanged: changeImplementation,
      );

  @override
  ParamsInteractor buildParams(BuildContext context) =>
      implementation.requiredParams.interactor(params, key: _paramsKey);

  @override
  DigestData get current => DigestData(_implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef DigestDataInteractorKey = InteractorKey<DigestDataInteractorState>;
