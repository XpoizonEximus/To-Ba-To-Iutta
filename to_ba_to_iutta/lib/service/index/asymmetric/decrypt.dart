import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/service/index/decrypt.dart';
import 'package:to_ba_to_iutta/service/index/asymmetric/index.dart';
import 'package:to_ba_to_iutta/service/key_manager/asymmetric.dart';
import 'package:to_ba_to_iutta/service/processor/decryptor/asymmetric.dart';

class AsymmetricDecryptService extends AsymmetricService with DecryptService {
  @override
  final AsymmetricKeyManager keyManager = AsymmetricKeyManager(false);

  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    final byteInput = DechunkedStreamQueue(input);
    final algorithm = await packager.load(byteInput);
    final result = AsymmetricDecryptor(keyManager, algorithm)
        .process(StreamQueue(byteInput.restChunks));
    yield* super.work(StreamQueue(result));
  }
}
