part of "../../index.dart";

abstract class Kdf extends Mean {
  const Kdf(KdfParams super.params);

  @override
  KdfData get data;

  int get outputSize;

  FutureOr<Bytes> process(Bytes input, KdfVariables variables,
      {syncronized = true});

  KdfProcessor newProcessor(KdfVariables variables,
      {bool syncronized = true});
}

abstract class KdfProcessor extends Processor {
  KdfVariables variables;
  KdfProcessor(this.variables, {super.syncronized = true});
}
