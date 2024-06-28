import 'dart:typed_data';

typedef Byte = int;
typedef Bytes = Uint8List;

class BoundedInt {
  final int min;
  final int max;

  final int value;

  BoundedInt(this.value, {required this.min, required this.max}) {
    if (value < min || value > max) {
      throw ArgumentError(
          "Value $value must be between $min (inclusive) and $max (inclusive).");
    }
  }
}
