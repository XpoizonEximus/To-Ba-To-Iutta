import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/service/processor/index.dart';

class Decryptor extends CryptographicProcessor {
  @override
  final bool forDecryption = true;

  Decryptor(super.keyManager, super.algorithm);

  @override
  Future<Bytes> get key => keyManager.decryptionKey;
}
