part of "../../index.dart";

abstract class CryptographyDigest extends Digest {
  final c.HashAlgorithm _algorithm;

  const CryptographyDigest(super.params, this._algorithm);

  @override
  int get outputSize => _algorithm.hashLengthInBytes;
  @override
  int get blockSize => _algorithm.blockLengthInBytes;

  @override
  FutureOr<Bytes> process(Bytes input, {bool syncronized = true}) {
    if (syncronized) {
      return Bytes.fromList(_algorithm.toSync().hashSync(input.toList()).bytes);
    } else {
      return (() async =>
          Bytes.fromList((await _algorithm.hash(input.toList())).bytes))();
    }
  }

  @override
  DigestProcessor newProcessor({bool syncronized = true}) =>
      _CryptographyDigestProcessor(_algorithm, syncronized: syncronized);
}

class _CryptographyDigestProcessor extends DigestProcessor {
  final dc.DartHashSink _syncSink;
  final c.HashSink _asyncSink;
  int _bufferLength = 0;

  _CryptographyDigestProcessor(c.HashAlgorithm algorithm,
      {super.syncronized = true})
      : _syncSink = algorithm.toSync().newHashSink(),
        _asyncSink = algorithm.newHashSink();

  @override
  void put(Bytes chunk) {
    if (syncronized) {
      if (_syncSink.isClosed) {
        _syncSink.reset();
      }
      _syncSink.addSlice(chunk, 0, chunk.length, false);
    } else {
      _asyncSink.addSlice(chunk, 0, chunk.length, false);
      _bufferLength += chunk.length;
    }
  }

  @override
  FutureOr<Bytes> get result {
    if (syncronized) {
      if (!_syncSink.isClosed) {
        _syncSink.close();
      }
      return Bytes.fromList(_syncSink.hashSync().bytes);
    } else {
      return () async {
        _asyncSink.close();
        return Bytes.fromList((await _asyncSink.hash()).bytes);
      }();
    }
  }

  @override
  int get length => syncronized ? _syncSink.length : _bufferLength;
}
