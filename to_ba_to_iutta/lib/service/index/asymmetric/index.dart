import 'package:to_ba_to_iutta/service/index/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/asymmetric.dart';

abstract class AsymmetricService extends Service {
  @override
  final AsymmetricPackager packager = AsymmetricPackager();
}
