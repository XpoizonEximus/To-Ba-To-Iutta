part of "../index.dart";

class BigIntSerializer extends Serializer<BigInt> {
  final IntSerializer intSerializer;

  const BigIntSerializer([this.intSerializer = const IntSerializer()]);

  @override
  Stream<Byte> serialize(BigInt input) async* {
    int length = (input.bitLength / 8).ceil();
    yield* intSerializer.serialize(length);
    var bigInt = input;

    for (var i = 1; i <= length; i++) {
      yield bigInt.toUnsigned(8).toInt();
      bigInt = bigInt >> 8;
    }
  }

  @override
  Future<BigInt> load(StreamQueue<Byte> input) async {
    final bytes = Bytes(await intSerializer.load(input));
    for (int i = 0; i < bytes.length; ++i) {
      bytes[bytes.length - i - 1] = await input.next;
    }

    BigInt result = BigInt.zero;
    for (int i = 0; i < bytes.length; ++i) {
      result = (result << 8) | BigInt.from(bytes[i]);
    }

    return result;
  }
}
