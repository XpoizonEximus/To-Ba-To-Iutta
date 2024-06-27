part of "../../index.dart";

abstract class _PointyCastleKdf extends Kdf {
  pc.KeyDerivator algorithm(KdfVariables variables);

  _PointyCastleKdf(super.params);

  @override
  FutureOr<Bytes> process(Bytes input, KdfVariables variables,
      {syncronized = false}) async {
    f() => algorithm(variables).process(input);

    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }
}
