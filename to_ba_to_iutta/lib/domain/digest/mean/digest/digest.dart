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

abstract class DigestProcessor {
  final bool syncronized;

  const DigestProcessor({this.syncronized = true});

  void put(Bytes chunk);
  FutureOr<Bytes> get result;
  int get length;
}
