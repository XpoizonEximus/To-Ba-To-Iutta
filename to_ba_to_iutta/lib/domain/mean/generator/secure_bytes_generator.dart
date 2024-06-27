part of "../index.dart";

class SecureBytesGenerator extends Generator<Bytes> {
  final int size;
  const SecureBytesGenerator(int size) : size = size < 0 ? 16 : size;

  @override
  Future<Bytes> get get async {
    final result = Bytes(size);

    final generator = Random.secure();
    for (int i = 0; i < size; ++i) {
      result[i] = generator.nextInt(256);
    }

    return result;
  }
}
