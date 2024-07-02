part of "../index.dart";

abstract class Serializer<T> {
  const Serializer();

  Stream<Byte> serialize(T input);
  Future<T> load(StreamQueue<Byte> input);
}
