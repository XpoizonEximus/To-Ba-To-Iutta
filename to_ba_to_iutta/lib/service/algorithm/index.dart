import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';

abstract class Algorithm {
  Stream<Bytes> compute(
      bool forDecryption, StreamQueue<Bytes> input, Bytes key);
}
