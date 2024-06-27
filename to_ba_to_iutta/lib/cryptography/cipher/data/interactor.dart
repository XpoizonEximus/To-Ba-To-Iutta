part of "../index.dart";

class CipherDataInteractor extends DataInteractor<CipherData> {
  const CipherDataInteractor(
      {super.key,
      required super.initial,
      super.title = "Key derivation function data",
      super.description =
          "Select the implementation wanted for the Cipher algorithm and its parameters."});

  @override
  CipherDataInteractorState createState() => CipherDataInteractorState();
}

class CipherDataInteractorState
    extends DataInteractorState<CipherData, CipherDataInteractor> {
  final _implementationKey = CipherImplementationInteractorKey();
  final _paramsKey = CipherParamsInteractorKey();

  late CipherImplementation _implementation;

  @override
  void initState() {
    _implementation = widget.initial.implementation as CipherImplementation;
    super.initState();
  }

  @override
  Widget buildImplementation(BuildContext context) =>
      CipherImplementationInteractor(
        initial: widget.initial.implementation as CipherImplementation,
        onChanged: (implementation) => setState(() {
          _implementation = implementation;
        }),
      );

  @override
  Widget buildParams(BuildContext context) => _implementation.requiredParams
      .interactor(_implementation.requiredParams.defaults, key: _paramsKey);

  @override
  CipherData get current => CipherData(_implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef CipherDataInteractorKey<T extends CipherData>
    = InteractorKey<CipherDataInteractorState>;
