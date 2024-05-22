part of "../index.dart";

class IntSerializer extends Serializer<int> {
  final int byteLength;

  const IntSerializer({this.byteLength = 8});

  @override
  Stream<Byte> serialize(int input) async* {
    var data = ByteData(byteLength);

    for (int i = 0; i < byteLength; ++i) {
      data.setInt8(i, input % 256);
      input ~/= 256;
    }
    for (Byte byte in data.buffer.asInt8List()) {
      yield byte;
    }
  }

  @override
  Future<int> load(Stream<Byte> input) async {
    List<Byte> bytesBuffer = [];
    StreamSubscription<Byte>? subscription;
    Completer<List<Byte>> completer = Completer<List<Byte>>();

    subscription = input.listen((byte) {
      if (bytesBuffer.length < byteLength) {
        bytesBuffer.add(byte);
      }

      if (bytesBuffer.length >= byteLength) {
        subscription?.cancel();
        completer.complete(bytesBuffer);
      }
    }, onDone: () {
      if (completer.isCompleted) {
        completer.complete(bytesBuffer);
      } else {
        completer.completeError(FormatException(
            "Input too short to read integer of $byteLength bytes", input));
      }
    }, onError: (e) {
      if (completer.isCompleted) {
        completer.complete(bytesBuffer);
      } else {
        completer.completeError(e);
      }
    });

    var fullBytes = [0, 0, 0, 0, 0, 0, 0, 0];
    final bytes = await completer.future;
    fullBytes.replaceRange(0, bytes.length, bytes);

    return ByteData.sublistView(Uint8List.fromList(fullBytes))
        .getInt64(0, Endian.little);
  }
}
