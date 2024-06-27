part of "../index.dart";

class PackageCryptographyDigestAdapter extends c.HashAlgorithm {
  final Digest _algorithm;

  const PackageCryptographyDigestAdapter(this._algorithm);

  @override
  int get blockLengthInBytes {
    return _algorithm.blockSize;
  }

  @override
  Future<c.Hash> hash(List<int> input) async {
    return c.Hash((await (_algorithm.process(Bytes.fromList(input),
            syncronized: false) as Future<Bytes>))
        .toList());
  }

  @override
  int get hashLengthInBytes {
    return _algorithm.outputSize;
  }

  @override
  dc.DartHashAlgorithm toSync() {
    return PackageDartCryptographyDigestAdapter(_algorithm);
  }
}

class PackageDartCryptographyDigestAdapter extends dc.DartHashAlgorithm {
  final Digest _algorithm;

  PackageDartCryptographyDigestAdapter(this._algorithm);

  @override
  int get blockLengthInBytes {
    return _algorithm.blockSize;
  }

  @override
  Future<c.Hash> hash(List<int> input) async {
    return c.Hash((await (_algorithm.process(Bytes.fromList(input),
            syncronized: false) as Future<Bytes>))
        .toList());
  }

  @override
  int get hashLengthInBytes {
    return _algorithm.outputSize;
  }

  @override
  c.Hash hashSync(List<int> data) {
    return c.Hash(
        (_algorithm.process(Bytes.fromList(data), syncronized: true) as Bytes)
            .toList());
  }

  @override
  dc.DartHashSink newHashSink() {
    return PackageDartSinkCryptographyDigestAdapter(_algorithm);
  }
}

class PackageDartSinkCryptographyDigestAdapter implements dc.DartHashSink {
  final DigestProcessor _processor;
  bool _closed = false;

  PackageDartSinkCryptographyDigestAdapter(Digest algorithm)
      : _processor = algorithm.newProcessor(syncronized: true);

  @override
  Uint8List get hashBytes {
    return _processor.result as Bytes;
  }

  @override
  bool get isClosed {
    return _closed;
  }

  @override
  int get length {
    return _processor.length;
  }

  @override
  void reset() {
    _processor.result as Bytes;
    _closed = false;
  }

  @override
  void add(List<int> chunk) {
    if (_closed) throw StateError("Bad state: Sink closed");
    _processor.put(Uint8List.fromList(chunk));
  }

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {
    add(chunk.sublist(start, end));
    if (isLast) {
      close();
    }
  }

  @override
  void close() {
    _closed = true;
  }

  @override
  Future<c.Hash> hash() async {
    if (!_closed) throw StateError("Bad state: Sink not closed");
    return c.Hash(_processor.result as Bytes);
  }

  @override
  c.Hash hashSync() {
    if (!_closed) throw StateError("Bad state: Sink not closed");
    return c.Hash(_processor.result as Bytes);
  }
}
