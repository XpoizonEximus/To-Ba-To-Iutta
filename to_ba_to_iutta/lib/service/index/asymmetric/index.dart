import 'package:to_ba_to_iutta/service/index/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/asymmetric.dart';
import 'package:to_ba_to_iutta/service/key_manager/asymmetric.dart';

abstract class AsymmetricService extends Service {
  @override
  abstract final AsymmetricKeyManager keyManager;
  @override
  final AsymmetricPackager packager = AsymmetricPackager();
}
