import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import 'package:to_ba_to_iutta/service/key_manager/symmetric.dart';
import 'package:to_ba_to_iutta/service/processor/encryptor/index.dart';

class SymmetricEncryptor extends Encryptor {
  SymmetricEncryptor(
      SymmetricKeyManager super.keyManager, SymmetricAlgorithm super.algorithm);
}
