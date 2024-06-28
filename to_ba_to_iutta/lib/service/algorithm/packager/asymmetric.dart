import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/asymmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/index.dart';

class AsymmetricPackager extends Pacakger<AsymmetricAlgorithm> {
  final _symmetricSerializer = CipherDataSerializer();
  final _asymmetricSerializer = AsymmetricCipherDataSerializer();

  @override
  Stream<Byte> serialize(AsymmetricAlgorithm input) async* {
    yield* _asymmetricSerializer.serialize(input.asymmetric.data);
    yield* _symmetricSerializer.serialize(input.symmetric.data);
  }

  @override
  Future<AsymmetricAlgorithm> load(StreamQueue<Byte> input) async =>
      AsymmetricAlgorithm((await _asymmetricSerializer.load(input)).newMean,
          (await _symmetricSerializer.load(input)).newMean);
}
