part of "../index.dart";

class PackagePointyCastleDigestAdapter implements pc.Digest {
  final Digest _algorithm;
  final DigestProcessor _processor;

  PackagePointyCastleDigestAdapter(this._algorithm)
      : _processor = _algorithm.newProcessor(syncronized: true);

  @override
  String get algorithmName => _algorithm.data.implementation.name;

  @override
  int get byteLength => throw UnimplementedError("Unknown byte length");

  @override
  int get digestSize => _algorithm.outputSize;

  @override
  int doFinal(Uint8List out, int outOff) {
    final res = _processor.result as Bytes;
    out.replaceRange(outOff, outOff + res.length, res);
    return res.length;
  }

  @override
  Uint8List process(Uint8List data) {
    _processor.put(data);
    return _processor.result as Bytes;
  }

  @override
  void reset() => _processor.result as Bytes;

  @override
  void update(Uint8List inp, int inpOff, int len) =>
      _processor.put(inp.sublist(inpOff, inpOff + len));

  @override
  void updateByte(int inp) => _processor.put(Uint8List.fromList([inp]));
}
