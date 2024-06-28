import 'package:to_ba_to_iutta/service/index/index.dart';
import 'package:to_ba_to_iutta/service/key_manager/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/symmetric.dart';

abstract class SymmetricService extends Service {
  @override
  final SymmetricKeyManager keyManager = SymmetricKeyManager();

  @override
  final SymmetricPackager packager = SymmetricPackager();
}
