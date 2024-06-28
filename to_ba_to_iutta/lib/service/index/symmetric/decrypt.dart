import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/service/index/decrypt.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/index.dart';
import 'package:to_ba_to_iutta/service/processor/decryptor/symmetric.dart';

class SymmetricDecryptService extends SymmetricService with DecryptService {
  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    final byteInput = DechunkedStreamQueue(input);
    final algorithm = await packager.load(byteInput);
    final result = SymmetricDecryptor(keyManager, algorithm)
        .process(StreamQueue(byteInput.restChunks));
    yield* super.work(StreamQueue(result));
  }
}
