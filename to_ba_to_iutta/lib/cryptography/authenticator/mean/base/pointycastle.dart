part of "../../index.dart";

abstract class _PointyCastleAuthenticator extends Authenticator {
  const _PointyCastleAuthenticator(super.params);

  @override
  _PointyCastleAuthenticatorProcessor newProcessor(
      AuthenticatorVariables variables,
      {bool syncronized = true});
}

abstract class _PointyCastleAuthenticatorProcessor
    extends AuthenticatorProcessor {
  pc.Mac get algorithm;
  late Bytes _lastResult;
  bool _updated = false;

  _PointyCastleAuthenticatorProcessor(super.variables,
      {super.syncronized = true}) {
    _lastResult = algorithm.process(Bytes.fromList([]));
  }

  @override
  void put(Bytes chunk) {
    algorithm.update(chunk, 0, chunk.length);
    _updated = true;
  }

  @override
  FutureOr<Bytes> get result {
    Bytes f() {
      if (_updated) {
        _lastResult = Bytes(algorithm.macSize);
        algorithm.doFinal(_lastResult, 0);
      }
      _updated = false;
      return _lastResult;
    }

    if (syncronized) {
      return f();
    } else {
      return (() async => f())();
    }
  }
}
