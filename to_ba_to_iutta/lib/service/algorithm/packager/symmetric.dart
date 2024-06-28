import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/index.dart';

class SymmetricPackager extends Pacakger<SymmetricAlgorithm> {
  final _cipherSerializer = CipherDataSerializer();
  final _kdfSerializer = KdfDataSerializer();

  @override
  Stream<Byte> serialize(SymmetricAlgorithm input) async* {
    yield* _cipherSerializer.serialize(input.cipher.data);
    yield* _kdfSerializer.serialize(input.kdf.data);
  }

  @override
  Future<SymmetricAlgorithm> load(StreamQueue<Byte> input) async =>
      SymmetricAlgorithm((await _cipherSerializer.load(input)).newMean,
          (await _kdfSerializer.load(input)).newMean);
}
