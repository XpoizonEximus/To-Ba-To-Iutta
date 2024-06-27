part of "../index.dart";

class PackagePointyCastleDigestAdapter implements pc.Digest {
  final DigestProcessor _processor;

  PackagePointyCastleDigestAdapter(Digest algorithm)
      : _processor = algorithm.newProcessor(syncronized: true),
        algorithmName = algorithm.data.implementation.name,
        digestSize = algorithm.outputSize;

  @override
  final String algorithmName;

  @override
  int get byteLength {
    return _processor.length;
  }

  @override
  final int digestSize;

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
  void reset() {
    _processor.result as Bytes;
  }

  @override
  void update(Uint8List inp, int inpOff, int len) =>
      _processor.put(inp.sublist(inpOff, inpOff + len));

  @override
  void updateByte(int inp) {
    return _processor.put(Uint8List.fromList([inp]));
  }
}
