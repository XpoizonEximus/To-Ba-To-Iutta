part of "../index.dart";

class BoundedIntSerializer extends Serializer<BoundedInt> {
  final int min;
  final int max;

  final IntSerializer? _serializer;

  int get _byteLength {
    int value = max - min;
    int byteLength = 0;

    while (value != 0) {
      ++byteLength;
      value = value ~/ 256;
    }

    return byteLength;
  }

  const BoundedIntSerializer({required this.min, required this.max})
      : _serializer = null;
  BoundedIntSerializer.withSerializer(
      {IntSerializer? serializer, required this.min, required this.max})
      : _serializer = serializer;

  @override
  Stream<Byte> serialize(BoundedInt input) =>
      (_serializer ?? IntSerializer(byteLength: _byteLength))
          .serialize(input.value - min);

  @override
  Future<BoundedInt> load(Stream<Byte> input) async => BoundedInt(
      (await (_serializer ?? IntSerializer(byteLength: _byteLength))
              .load(input)) +
          min,
      min: min,
      max: max);
}
