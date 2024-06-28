import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/index.dart';
import 'package:to_ba_to_iutta/service/key_manager/index.dart';

abstract class CryptographicProcessor {
  final KeyManager keyManager;
  final Algorithm algorithm;

  CryptographicProcessor(this.keyManager, this.algorithm);

  Stream<Bytes> process(StreamQueue<Bytes> input) async* {
    if (forDecryption) {
      final byteInput = DechunkedStreamQueue(input);
      final version = await byteInput.next;
      if (version != 0) {
        throw ArgumentError("Invalid version");
      }
      yield* algorithm.compute(
          forDecryption, StreamQueue(byteInput.restChunks), await key);
    } else {
      yield Bytes.fromList([0]);
      yield* algorithm.compute(forDecryption, input, await key);
    }
  }

  Future<Bytes> get key;
  bool get forDecryption;
}
