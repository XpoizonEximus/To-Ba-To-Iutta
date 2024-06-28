import 'package:to_ba_to_iutta/service/algorithm/asymmetric.dart';
import 'package:to_ba_to_iutta/service/key_manager/asymmetric.dart';
import 'package:to_ba_to_iutta/service/processor/encryptor/index.dart';

class AsymmetricEncryptor extends Encryptor {
  AsymmetricEncryptor(AsymmetricKeyManager super.keyManager,
      AsymmetricAlgorithm super.algorithm);
}
