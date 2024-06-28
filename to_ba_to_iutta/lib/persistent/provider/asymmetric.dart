import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/persistent/provider/index.dart';
import 'package:to_ba_to_iutta/persistent/settings.dart';
import 'package:to_ba_to_iutta/service/algorithm/asymmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/asymmetric.dart';

class AsymmetricAlgorithmProvider
    extends AlgorithmProvider<AsymmetricAlgorithm> {
  AsymmetricAlgorithmProvider()
      : super(SettingsProvider(false, _defaults), _steticPackager);
  static final _steticPackager = AsymmetricPackager();

  static Stream<Byte> get _defaults =>
      _steticPackager.serialize(AsymmetricAlgorithm(
          AsymmetricCipherData.defaults.newMean, CipherData.defaults.newMean));
}
