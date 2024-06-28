import 'package:to_ba_to_iutta/bytes.dart';

abstract class KeyManager {
  Future<Bytes> get encryptionKey;
  Future<Bytes> get decryptionKey;
  void dispose() {}
}
