part of "../index.dart";

class AsymmetricCipherParamsInteractor
    extends ParamsInteractor<AsymmetricCipherParams> {
  const AsymmetricCipherParamsInteractor(
      {super.key,
      required super.initial,
      super.title = "Asymmetric cipher parameters",
      super.description =
          "Here choose the desired parameters and implementation regarding asymmetric encryption."});

  @override
  AsymmetricCipherParamsInteractorState<AsymmetricCipherParamsInteractor>
      createState() => AsymmetricCipherParamsInteractorState<
          AsymmetricCipherParamsInteractor>();
}

class AsymmetricCipherParamsInteractorState<
        I extends AsymmetricCipherParamsInteractor>
    extends ParamsInteractorState<AsymmetricCipherParams, I> {
  final NamedEnumInteractorKey<AsymmetricCipherEngine> _engineKey =
      NamedEnumInteractorKey();
  final NamedEnumInteractorKey<AsymmetricEncoding> _encodingKey =
      NamedEnumInteractorKey();

  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield NamedEnumInteractor(
        key: _engineKey,
        initial: widget.initial.engine,
        title: "Asymmetric cipher engine",
        description: "The algorithm itself used for encryption",
        values: AsymmetricCipherEngine.values);
    yield NamedEnumInteractor(
        key: _encodingKey,
        initial: widget.initial.encoding,
        title: "Asymmetric encoding",
        description:
            "The encoding prepares the input for encryption. Asymmetric encryption is highly sensible, therefore a specialized algorithm is needed.",
        values: AsymmetricEncoding.values);
  }

  @override
  AsymmetricCipherParams get current => AsymmetricCipherParams(
      _engineKey.currentState?.current ?? widget.initial.engine,
      _encodingKey.currentState?.current ?? widget.initial.encoding);
}

typedef AsymmetricCipherParamsInteractorKey = InteractorKey<
    AsymmetricCipherParamsInteractorState<AsymmetricCipherParamsInteractor>>;
