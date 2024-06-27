part of "../../index.dart";

abstract class Kdf extends Mean {
  final int nonceSize;

  Kdf(KdfParams super.params) : nonceSize = params.nonceSize;

  Future<Bytes> get newNonce => SecureBytesGenerator(nonceSize).get;

  @override
  KdfData get data;

  FutureOr<Bytes> process(Bytes input, KdfVariables variables,
      {syncronized = true});
}
