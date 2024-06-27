part of "../../index.dart";

class StreamCipherParamsSerializer extends CipherParamsSerializer {
  const StreamCipherParamsSerializer();

  @override
  Stream<Byte> serialize(covariant StreamCipherParams input) async* {
    yield* super.serialize(input);
  }

  @override
  Future<StreamCipherParams> load(StreamQueue<Byte> input) async =>
      StreamCipherParams(await super.load(input));
}
