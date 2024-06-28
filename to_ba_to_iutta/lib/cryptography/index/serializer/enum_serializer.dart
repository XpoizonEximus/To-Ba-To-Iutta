part of "../index.dart";

class EnumSerializer<T> extends Serializer<T> {
  final List<T> _values;

  const EnumSerializer(this._values);

  @override
  Stream<Byte> serialize(T input) async* {
    if (_values.length > 255) {
      throw UnimplementedError("Too many values in the enum");
    }
    yield _values.indexOf(input);
  }

  @override
  Future<T> load(StreamQueue<Byte> input) async {
    if (_values.length > 255) {
      throw UnimplementedError("Too many values in the enum");
    }
    return _values[await input.next];
  }
}
