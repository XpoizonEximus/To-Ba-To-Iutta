part of "../../index.dart";

abstract class _CryptographyKdf extends Kdf {
  c.KdfAlgorithm algorithm(KdfVariables variables);

  _CryptographyKdf(super.params);

  @override
  Future<Bytes> process(Bytes input, KdfVariables variables,
      {syncronized = false}) async {
    if (syncronized) {
      throw UnsupportedError("This KDF cannot be syncronized");
    } else {
      return Bytes.fromList(await (await algorithm(variables)
              .deriveKey(secretKey: c.SecretKey(input), nonce: variables.nonce))
          .extractBytes());
    }
  }
}
