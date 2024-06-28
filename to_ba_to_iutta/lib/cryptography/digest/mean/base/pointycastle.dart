part of "../../index.dart";

abstract class _PointyCastleDigest extends Digest {
  final pc.Digest _algorithm;

  const _PointyCastleDigest(super.params, this._algorithm);

  @override
  int get outputSize => _algorithm.digestSize;

  @override
  FutureOr<Bytes> process(Bytes input, {bool syncronized = true}) {
    Bytes f() => _algorithm.process(input);
    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }

  @override
  DigestProcessor newProcessor({bool syncronized = true}) =>
      _PointyCastleDigestProcessor(
          (data.newMean as _PointyCastleDigest)._algorithm,
          syncronized: syncronized);
}

class _PointyCastleDigestProcessor extends DigestProcessor {
  final pc.Digest _algorithm;
  int _bufferLength = 0;
  Bytes _lastResult;

  _PointyCastleDigestProcessor(this._algorithm, {super.syncronized = true})
      : _lastResult = _algorithm.process(Bytes.fromList([]));

  @override
  void put(Bytes chunk) {
    _algorithm.update(chunk, 0, chunk.length);
    _bufferLength += chunk.length;
  }

  @override
  FutureOr<Bytes> get result {
    Bytes f() {
      if (_bufferLength != 0) {
        _lastResult = Bytes(_algorithm.digestSize);
        _algorithm.doFinal(_lastResult, 0);
      }
      _bufferLength = 0;
      return _lastResult;
    }

    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }

  @override
  int get length => _bufferLength;
}
