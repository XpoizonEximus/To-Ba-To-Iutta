part of "../index.dart";

class AsymmetricCipherDataInteractor extends DataInteractor<AsymmetricCipherData> {
  const AsymmetricCipherDataInteractor(
      {super.key,
      required super.initial,
      super.title = "AsymmetricCipher data",
      super.description =
          "Select the implementation to be used for the AsymmetricCipher algorithm and its parameters."});

  @override
  AsymmetricCipherDataInteractorState createState() => AsymmetricCipherDataInteractorState();
}

class AsymmetricCipherDataInteractorState
    extends DataInteractorState<AsymmetricCipherData, AsymmetricCipherDataInteractor> {
  final _paramsKey = AsymmetricCipherParamsInteractorKey();

  late AsymmetricCipherImplementation _implementation;

  @override
  void initState() {
    _implementation = widget.initial.implementation as AsymmetricCipherImplementation;
    super.initState();
  }

  @override
  Widget buildImplementation(BuildContext context) =>
      AsymmetricCipherImplementationInteractor(
        initial: widget.initial.implementation as AsymmetricCipherImplementation,
        onChanged: (implementation) => setState(() {
          _implementation = implementation;
        }),
      );

  @override
  Widget buildParams(BuildContext context) => _implementation.requiredParams
      .interactor(_implementation.requiredParams.defaults, key: _paramsKey);

  @override
  AsymmetricCipherData get current => AsymmetricCipherData(_implementation,
      _paramsKey.currentState?.current ?? widget.initial.params);
}

typedef AsymmetricCipherDataInteractorKey = InteractorKey<AsymmetricCipherDataInteractorState>;
