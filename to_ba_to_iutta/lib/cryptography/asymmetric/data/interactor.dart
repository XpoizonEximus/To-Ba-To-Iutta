part of "../index.dart";

class AsymmetricCipherDataInteractor
    extends DataInteractor<AsymmetricCipherData> {
  const AsymmetricCipherDataInteractor(
      {super.key,
      required super.initial,
      super.title = "AsymmetricCipher data",
      super.description =
          "Select the implementation to be used for the AsymmetricCipher algorithm and its parameters."});

  @override
  AsymmetricCipherDataInteractorState createState() =>
      AsymmetricCipherDataInteractorState();
}

class AsymmetricCipherDataInteractorState extends DataInteractorState<
    AsymmetricCipherData, AsymmetricCipherDataInteractor> {
  final _paramsKey = AsymmetricCipherParamsInteractorKey();
  final _implementationKey = AsymmetricCipherImplementationInteractorKey();

  @override
  AsymmetricCipherImplementationInteractor buildImplementation(
          BuildContext context) =>
      AsymmetricCipherImplementationInteractor(
        key: _implementationKey,
        initial: implementation as AsymmetricCipherImplementation,
        onChanged: changeImplementation,
      );

  @override
  ParamsInteractor buildParams(BuildContext context) =>
      implementation.requiredParams.interactor(params, key: _paramsKey);

  @override
  AsymmetricCipherData get current => AsymmetricCipherData(
      _implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef AsymmetricCipherDataInteractorKey
    = InteractorKey<AsymmetricCipherDataInteractorState>;
