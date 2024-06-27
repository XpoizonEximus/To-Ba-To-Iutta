part of "../index.dart";

abstract class Generator<T> {
  const Generator();
  Future<T> get get;
}
