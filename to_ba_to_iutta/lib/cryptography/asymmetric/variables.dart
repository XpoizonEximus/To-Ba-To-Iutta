part of "index.dart";

class AsymmetricCipherVariables extends Variables {
  final BigInt modulus;
  final BigInt exponent;
  final BigInt? p;
  final BigInt? q;

  AsymmetricCipherVariables(
      {required this.modulus, required this.exponent, this.p, this.q});
}

class AsymmetricCipherVariablesSerializer
    extends Serializer<AsymmetricCipherVariables> {
  final BigIntSerializer bigIntSerializer;

  const AsymmetricCipherVariablesSerializer(
      [this.bigIntSerializer = const BigIntSerializer()]);

  @override
  Stream<Byte> serialize(AsymmetricCipherVariables input) async* {
    yield* bigIntSerializer.serialize(input.modulus);
    yield* bigIntSerializer.serialize(input.exponent);
    if (input.p == null || input.q == null) {
      yield 0;
    } else {
      yield 1;
      yield* bigIntSerializer.serialize(input.p!);
      yield* bigIntSerializer.serialize(input.q!);
    }
  }

  @override
  Future<AsymmetricCipherVariables> load(StreamQueue<Byte> input) async {
    final modulus = await bigIntSerializer.load(input);
    final exponent = await bigIntSerializer.load(input);
    if (await input.next == 0) {
      return AsymmetricCipherVariables(modulus: modulus, exponent: exponent);
    } else {
      final p = await bigIntSerializer.load(input);
      final q = await bigIntSerializer.load(input);

      return AsymmetricCipherVariables(
          modulus: modulus, exponent: exponent, p: p, q: q);
    }
  }
}
