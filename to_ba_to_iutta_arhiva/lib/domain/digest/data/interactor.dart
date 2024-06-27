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

  late DigestImplementation _implementation;

  @override
  void initState() {
    _implementation = widget.initial.implementation as DigestImplementation;
    super.initState();
  }

  @override
  Widget buildImplementation(BuildContext context) =>
      DigestImplementationInteractor(
        initial: widget.initial.implementation as DigestImplementation,
        onChanged: (implementation) => setState(() {
          _implementation = implementation;
        }),
      );

  @override
  Widget buildParams(BuildContext context) => _implementation.requiredParams
      .interactor(_implementation.requiredParams.defaults, key: _paramsKey);

  @override
  DigestData get current => DigestData(_implementation,
      _paramsKey.currentState?.current ?? widget.initial.params);
}

typedef DigestDataInteractorKey = InteractorKey<DigestDataInteractorState>;
