import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/provider/asymmetric.dart';
import 'package:to_ba_to_iutta/service/index/encrypt.dart';
import 'package:to_ba_to_iutta/service/index/asymmetric/index.dart';
import 'package:to_ba_to_iutta/service/key_manager/asymmetric.dart';
import 'package:to_ba_to_iutta/service/processor/encryptor/asymmetric.dart';

class AsymmetricEncryptService extends AsymmetricService with EncryptService {
  @override
  final AsymmetricKeyManager keyManager = AsymmetricKeyManager(true);

  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    final algorithm = await AsymmetricAlgorithmProvider().algorithm;
    yield Bytes.fromList(await packager.serialize(algorithm).toList());
    yield* AsymmetricEncryptor(keyManager, algorithm)
        .process(StreamQueue(super.work(input)));
  }
}
