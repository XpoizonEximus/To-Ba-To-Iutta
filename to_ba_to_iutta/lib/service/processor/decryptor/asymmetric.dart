import 'package:to_ba_to_iutta/service/algorithm/asymmetric.dart';
import 'package:to_ba_to_iutta/service/key_manager/asymmetric.dart';
import 'package:to_ba_to_iutta/service/processor/decryptor/index.dart';

class AsymmetricDecryptor extends Decryptor {
  AsymmetricDecryptor(AsymmetricKeyManager super.keyManager,
      AsymmetricAlgorithm super.algorithm);
}
