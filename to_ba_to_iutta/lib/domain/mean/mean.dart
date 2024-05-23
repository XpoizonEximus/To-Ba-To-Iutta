part of "index.dart";

abstract class Mean {
  const Mean(Params params);
  Data get data;
}

abstract class Processor {
  final bool syncronized;
  const Processor({this.syncronized = true});

  void put(Bytes chunk);
  FutureOr<Bytes> get result;
}
