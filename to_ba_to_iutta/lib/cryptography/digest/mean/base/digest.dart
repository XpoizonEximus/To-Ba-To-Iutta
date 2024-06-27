part of "../../index.dart";

abstract class Digest extends Mean {
  const Digest(DigestParams super.params);

  @override
  DigestData get data;

  int get blockSize;
  int get outputSize;

  FutureOr<Bytes> process(Bytes input, {bool syncronized = true});
  DigestProcessor newProcessor({bool syncronized = true});
}

abstract class DigestProcessor extends Processor {
  const DigestProcessor({super.syncronized = true});
  int get length;
}
