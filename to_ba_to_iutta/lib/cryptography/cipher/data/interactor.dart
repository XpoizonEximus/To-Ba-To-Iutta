part of "../index.dart";

class CipherDataInteractor extends DataInteractor<CipherData> {
  const CipherDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Cipher data",
      super.description =
          "Select the implementation wanted for the cipher algorithm and its parameters."});

  @override
  CipherDataInteractorState createState() => CipherDataInteractorState();
}

class CipherDataInteractorState
    extends DataInteractorState<CipherData, CipherDataInteractor> {
  final _implementationKey = CipherImplementationInteractorKey();
  final _paramsKey = CipherParamsInteractorKey();

  @override
  CipherImplementationInteractor buildImplementation(BuildContext context) =>
      CipherImplementationInteractor(
        key: _implementationKey,
        initial: implementation as CipherImplementation,
        onChanged: changeImplementation,
      );

  @override
  ParamsInteractor buildParams(BuildContext context) =>
      implementation.requiredParams.interactor(params, key: _paramsKey);

  @override
  CipherData get current => CipherData(_implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef CipherDataInteractorKey<T extends CipherData>
    = InteractorKey<CipherDataInteractorState>;
