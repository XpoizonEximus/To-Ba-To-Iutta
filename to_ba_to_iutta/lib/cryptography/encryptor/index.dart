import 'dart:typed_data';

abstract class Encryptor {
  Future<Uint8List> encrypt(Uint8List data, Uint8List key);
}
