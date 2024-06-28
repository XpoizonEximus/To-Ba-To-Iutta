import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/service/processor/index.dart';

class Encryptor extends CryptographicProcessor {
  @override
  final bool forDecryption = false;

  Encryptor(super.keyManager, super.algorithm);

  @override
  Future<Bytes> get key => keyManager.encryptionKey;
}
