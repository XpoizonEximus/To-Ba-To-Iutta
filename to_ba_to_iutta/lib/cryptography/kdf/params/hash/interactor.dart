part of "../../index.dart";

class HashKdfParamsInteractor extends KdfParamsInteractor {
  @override
  HashKdfParams get initial => super.initial as HashKdfParams;
  const HashKdfParamsInteractor(
      {super.key,
      required HashKdfParams super.initial,
      super.title = "Hash-based key derivator parameters",
      super.description =
          "Used by the HKDF algorithm. The main parameter is the digest used."});

  @override
  HashKdfParamsInteractorState createState() => HashKdfParamsInteractorState();
}

class HashKdfParamsInteractorState
    extends KdfParamsInteractorState<HashKdfParamsInteractor> {
  final _digestDataKey = DigestDataInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield DigestDataInteractor(
      key: _digestDataKey,
      initial: widget.initial.digestData,
      title: "Digest algorithm",
      description:
          "This algorithm uses a digest to derive the key. Here update the data of the digest used.",
    );
  }

  @override
  HashKdfParams get current => HashKdfParams(super.current,
      _digestDataKey.currentState?.current ?? widget.initial.digestData);
}

typedef HashKdfParamsInteractorKey
    = InteractorKey<HashKdfParamsInteractorState>;
