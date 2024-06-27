part of "../index.dart";

abstract class Cipher extends Mean {
  const Cipher(CipherParams super.params);

  @override
  CipherData get data;

  Stream<Bytes> encrypt(StreamQueue<Bytes> input, CipherVariables variables);
  Stream<Bytes> decrypt(StreamQueue<Bytes> input, CipherVariables variables);

  int get keySize;
  Future<Bytes> get newKey;

  int get nonceSize;
  Future<Bytes> get newNonce;

  int get macSize;

  Stream<Bytes> extractMac(
      StreamQueue<Bytes> input, Function(Bytes mac) onMac) async* {
    var buffer = Bytes(0);

    await for (Bytes chunk in input.rest) {
      var newBuffer = Bytes(buffer.length + chunk.length);
      newBuffer.setRange(0, buffer.length, buffer);
      newBuffer.setRange(buffer.length, newBuffer.length, chunk);
      buffer = newBuffer;

      if (buffer.length > macSize) {
        final breakpoint = buffer.length - macSize;
        yield buffer.sublist(0, breakpoint);
        buffer = buffer.sublist(breakpoint);
      }

      await Future.delayed(Duration.zero);
    }

    onMac(Bytes.fromList(buffer.toList()));
  }
}
