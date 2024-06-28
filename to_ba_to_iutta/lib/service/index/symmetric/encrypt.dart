import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/provider/symmetric.dart';
import 'package:to_ba_to_iutta/service/index/encrypt.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/index.dart';
import 'package:to_ba_to_iutta/service/processor/encryptor/symmetric.dart';

class SymmetricEncryptService extends SymmetricService with EncryptService {
  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    final algorithm = await SymmetricAlgorithmProvider().algorithm;
    yield Bytes.fromList(
        await packager.serialize(algorithm).toList());
    yield* SymmetricEncryptor(keyManager, algorithm)
        .process(StreamQueue(super.work(input)));
  }
}
