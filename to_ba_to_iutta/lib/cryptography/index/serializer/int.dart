part of "../index.dart";

class IntSerializer extends Serializer<int> {
  final int intLengthInBytes;

  const IntSerializer({this.intLengthInBytes = 8});

  @override
  Stream<Byte> serialize(int input) async* {
    var data = ByteData(intLengthInBytes);

    for (int i = 0; i < intLengthInBytes; ++i) {
      data.setInt8(i, input % 256);
      input ~/= 256;
    }
    for (Byte byte in data.buffer.asInt8List()) {
      yield byte;
    }
  }

  @override
  Future<int> load(StreamQueue<Byte> input) async {
    final bytes = [0, 0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < intLengthInBytes; ++i) {
      bytes[i] = await input.next;
    }

    return ByteData.sublistView(Bytes.fromList(bytes))
        .getInt64(0, Endian.little);
  }
}
