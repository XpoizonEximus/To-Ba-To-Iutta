import 'dart:typed_data';

abstract class Decryptor {
  Future<Uint8List> decrypt(Uint8List data, Uint8List key);
}
