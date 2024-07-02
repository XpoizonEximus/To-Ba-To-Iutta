part of "../../index.dart";

class BlakeDigestParamsInteractor extends DigestParamsInteractor {
  @override
  BlakeDigestParams get initial => super.initial as BlakeDigestParams;

  const BlakeDigestParamsInteractor(
      {super.key,
      required BlakeDigestParams super.initial,
      super.title = "Blake digest parameters",
      super.description = "Used by a Blake digest."});

  @override
  BlakeDigestParamsInteractorState createState() =>
      BlakeDigestParamsInteractorState();
}

class BlakeDigestParamsInteractorState
    extends DigestParamsInteractorState<BlakeDigestParamsInteractor> {
  final _enumKey = NamedEnumInteractorKey<BlakeDigestType>();
  final _intKey = BoundedIntInteractorKey();

  late BlakeDigestSize _initialOutputSize;

  @override
  void initState() {
    super.initState();
    _initialOutputSize = (initial as BlakeDigestParams)._outputSize;
  }

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<BlakeDigestType>(
        key: _enumKey,
        initial: (initial as BlakeDigestParams).type,
        title: "Type",
        description:
            "The 2b variant is optimized for 64-bit computing, therefore is suitable for most modern systems. The 2s is a lightweight variant optimized for 32-bit computing. They support output sizes ranging up to 64 and 32 bytes respectively.",
        values: BlakeDigestType.values,
        onChanged: (type) => setState(() {
              _initialOutputSize = BlakeDigestSize.defaults(type);
            }));
    yield BoundedIntInteractor(
      key: _intKey,
      initial: _initialOutputSize,
      title: "Output size",
      description:
          "The length of the resulting output. A higher value implies increased security, but also longer ciphertexts and possibly increased compoting time. Blake2b allows for sizes up to ${BlakeDigestSize.standardMax(BlakeDigestType.x2b)} bytes, while the 2s variant up to ${BlakeDigestSize.standardMax(BlakeDigestType.x2s)} bytes.",
      unitOfMeasure: 'bytes',
    );
  }

  @override
  BlakeDigestParams get current {
    final type = _enumKey.currentState!.current;
    return BlakeDigestParams(
        super.current, type, _intKey.currentState!.current.value);
  }
}

typedef BlakeDigestParamsInteractorKey
    = InteractorKey<BlakeDigestParamsInteractorState>;
