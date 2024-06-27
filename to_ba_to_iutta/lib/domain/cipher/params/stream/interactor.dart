part of "../../index.dart";

class StreamCipherParamsInteractor extends CipherParamsInteractor {
  @override
  StreamCipherParams get initial => super.initial as StreamCipherParams;

  const StreamCipherParamsInteractor(
      {super.key,
      required StreamCipherParams super.initial,
      super.title = "Stream cipher parameters",
      super.description =
          "Used by a stream ciphers."});

  @override
  StreamCipherParamsInteractorState createState() =>
      StreamCipherParamsInteractorState();
}

class StreamCipherParamsInteractorState<I extends StreamCipherParamsInteractor>
    extends CipherParamsInteractorState<I> {
  @override
  Iterable<Widget> buildParams(BuildContext context) sync* {
    yield* super.buildParams(context);
  }

  @override
  StreamCipherParams get current => StreamCipherParams(super.current);
}

typedef StreamCipherParamsInteractorKey
    = InteractorKey<StreamCipherParamsInteractorState>;
