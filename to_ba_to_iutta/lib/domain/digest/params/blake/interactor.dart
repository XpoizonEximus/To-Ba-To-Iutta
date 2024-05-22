part of "../../index.dart";

class BlakeDigestParamsInteractor
    extends DigestParamsInteractor<BlakeDigestParams> {
  const BlakeDigestParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Blake digest parameters",
      super.description = "Used by a Blake digest."});

  @override
  BlakeDigestParamsInteractorState createState() =>
      BlakeDigestParamsInteractorState();
}

class BlakeDigestParamsInteractorState extends DigestParamsInteractorState<
    BlakeDigestParams, BlakeDigestParamsInteractor> {
  final _enumKey = NamedEnumInteractorKey<BlakeType>();
  final _intKey = BoundedIntInteractorKey();

  late BlakeSize _outputSize;

  @override
  void initState() {
    super.initState();
    _outputSize = widget.initial.outputSize;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.buildContent(context),
        NamedEnumInteractor<BlakeType>(
            key: _enumKey,
            initial: widget.initial.type,
            title: "Type",
            description:
                "The 2b variant is optimized for 64-bit computing, therefore is suitable for most modern systems. The 2s is a lightweight variant optimized for 32-bit computing. They support output sizes ranging up to 64 and 32 bytes respectively.",
            values: BlakeType.values,
            onChanged: (type) => setState(() {
                  _outputSize = BlakeSize.defaults(type);
                })),
        BoundedIntInteractor(
            key: _intKey,
            initial: _outputSize,
            title: "Output size",
            description:
                "The length of the resulting output. A higher value implies increased security, but also longer ciphertexts and possibly increased compoting time. Blake2b allows for sizes up to ${BlakeSize.standardMax(BlakeType.x2b)} bytes, while the 2s variant up to ${BlakeSize.standardMax(BlakeType.x2s)} bytes."),
      ],
    );
  }

  @override
  BlakeDigestParams get current {
    final type = _enumKey.currentState?.current ?? widget.initial.type;
    return BlakeDigestParams(
        BlakeSize(
            (_intKey.currentState?.current ?? widget.initial.outputSize).value,
            type),
        type);
  }
}

typedef BlakeDigestParamsInteractorKey
    = InteractorKey<BlakeDigestParamsInteractorState>;
