part of "../../index.dart";

abstract class _CryptographyAuthenticator extends Authenticator {
  final c.MacAlgorithm _algorithm;

  const _CryptographyAuthenticator(super.params, this._algorithm);

  @override
  int get outputSize => _algorithm.macLength;

  @override
  FutureOr<Bytes> process(Bytes input, AuthenticatorVariables variables,
      {syncronized = true}) {
    if (syncronized) {
      return Bytes.fromList(_algorithm
          .toSync()
          .calculateMacSync(input,
              secretKeyData:
                  c.SecretKeyData(variables.key, overwriteWhenDestroyed: false),
              nonce: variables.nonce)
          .bytes);
    } else {
      return (() async => Bytes.fromList((await _algorithm.calculateMac(input,
              secretKey: c.SecretKey(variables.key), nonce: variables.nonce))
          .bytes))();
    }
  }

  @override
  _CryptographyAuthenticatorProcessor newProcessor(
          AuthenticatorVariables variables,
          {bool syncronized = true}) =>
      _CryptographyAuthenticatorProcessor(_algorithm, variables,
          syncronized: syncronized);
}

class _CryptographyAuthenticatorProcessor extends AuthenticatorProcessor {
  final c.MacAlgorithm _algorithm;
  Future<c.MacSink> _asyncSinkFuture;
  c.MacSink? _asyncSink;
  final dc.DartMacSinkMixin _syncSink;

  _CryptographyAuthenticatorProcessor(
    this._algorithm,
    super.variables, {
    super.syncronized = true,
  })  : _syncSink = _algorithm.toSync().newMacSinkSync(
            secretKeyData:
                c.SecretKeyData(variables.key, overwriteWhenDestroyed: false),
            nonce: variables.nonce),
        _asyncSinkFuture = _algorithm.newMacSink(
            secretKey: c.SecretKey(variables.key), nonce: variables.nonce);

  @override
  void put(Bytes chunk) {
    if (syncronized) {
      if (_syncSink.isClosed) {
        _reset(variables);
      }
      _syncSink.addSlice(chunk, 0, chunk.length, false);
    } else {
      () async {
        _asyncSink ??= await _asyncSinkFuture;
        if (_asyncSink!.isClosed) {
          _reset(variables);
          _asyncSink ??= await _asyncSinkFuture;
        }
        (await _asyncSinkFuture).addSlice(chunk, 0, chunk.length, false);
      }();
    }
  }

  @override
  set variables(AuthenticatorVariables variables) => _reset(variables);

  void _reset(AuthenticatorVariables variables) {
    super.variables = variables;
    _syncSink.initializeSync(
        secretKey:
            c.SecretKeyData(variables.key, overwriteWhenDestroyed: false),
        nonce: variables.nonce);
    _asyncSinkFuture = _algorithm.newMacSink(
        secretKey: c.SecretKey(variables.key), nonce: variables.nonce);
  }

  @override
  FutureOr<Bytes> get result {
    if (syncronized) {
      _syncSink.close();
      return Bytes.fromList(_syncSink.macSync().bytes);
    } else {
      return () async {
        _asyncSink ??= await _asyncSinkFuture;
        _asyncSink!.close();
        return Bytes.fromList((await _asyncSink!.mac()).bytes);
      }();
    }
  }
}
