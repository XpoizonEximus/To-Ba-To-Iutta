part of "../../index.dart";

class BlockCipherParamsInteractor extends CipherParamsInteractor {
  @override
  BlockCipherParams get initial => super.initial as BlockCipherParams;

  const BlockCipherParamsInteractor(
      {super.key,
      required BlockCipherParams super.initial,
      super.title = "Block cipher parameters",
      super.description =
          "Used by a block ciphers. The main parameter is the engine used."});

  @override
  BlockCipherParamsInteractorState createState() =>
      BlockCipherParamsInteractorState();
}

class BlockCipherParamsInteractorState<I extends BlockCipherParamsInteractor>
    extends CipherParamsInteractorState<I> {
  final _engineKey = NamedEnumInteractorKey<BlockCipherEngine>();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
    yield NamedEnumInteractor<BlockCipherEngine>(
        key: _engineKey,
        initial: (initial as BlockCipherParams).engine,
        title: "Engine",
        description:
            "This is the hearth of the algorithm. The engine processes 2 blocks of information (key and input) and outputs the resulting block.",
        values: BlockCipherEngine.values);
  }

  @override
  BlockCipherParams get current {
    return BlockCipherParams(_engineKey.currentState!.current, super.current);
  }
}

typedef BlockCipherParamsInteractorKey
    = InteractorKey<BlockCipherParamsInteractorState>;
