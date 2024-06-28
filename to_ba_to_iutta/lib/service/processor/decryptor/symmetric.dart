import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import 'package:to_ba_to_iutta/service/key_manager/symmetric.dart';
import 'package:to_ba_to_iutta/service/processor/decryptor/index.dart';

class SymmetricDecryptor extends Decryptor {
  SymmetricDecryptor(
      SymmetricKeyManager super.keyManager, SymmetricAlgorithm super.algorithm);
}
