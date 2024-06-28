import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/persistent/provider/index.dart';
import 'package:to_ba_to_iutta/persistent/settings.dart';
import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/symmetric.dart';

class SymmetricAlgorithmProvider extends AlgorithmProvider<SymmetricAlgorithm> {
  SymmetricAlgorithmProvider()
      : super(SettingsProvider(false, _defaults), _staticPackager);
  static final _staticPackager = SymmetricPackager();

  static Stream<Byte> get _defaults =>
      _staticPackager.serialize(SymmetricAlgorithm(
          CipherData.defaults.newMean, KdfData.defaults.newMean));
}
