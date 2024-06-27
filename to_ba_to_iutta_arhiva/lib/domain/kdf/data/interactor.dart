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

  late KdfImplementation _implementation;

  @override
  void initState() {
    _implementation = widget.initial.implementation as KdfImplementation;
    super.initState();
  }

  @override
  Widget buildImplementation(BuildContext context) =>
      KdfImplementationInteractor(
        initial: widget.initial.implementation as KdfImplementation,
        onChanged: (implementation) => setState(() {
          _implementation = implementation;
        }),
      );

  @override
  Widget buildParams(BuildContext context) => _implementation.requiredParams
      .interactor(_implementation.requiredParams.defaults, key: _paramsKey);

  @override
  KdfData get current => KdfData(_implementationKey.currentState!.current,
      _paramsKey.currentState!.current);
}

typedef KdfDataInteractorKey<T extends KdfData>
    = InteractorKey<KdfDataInteractorState>;
