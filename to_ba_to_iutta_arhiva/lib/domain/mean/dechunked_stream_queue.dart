part of "index.dart";

class DechunkedStreamQueue implements StreamQueue<Byte> {
  final StreamQueue<Bytes> _source;
  final Queue<Byte> _buffer = Queue<Byte>();
  int _eventCount = 0;

  DechunkedStreamQueue(this._source);

  final StreamController<Future> _events = StreamController<Future>();
  late final StreamQueue<Future> _eventsQueue = StreamQueue(_events.stream);

  @override
  Future<Byte> get next async {
    Completer completer = Completer();
    final future = completer.future.then((value) => ++_eventCount);
    _events.add(future);

    for (Future f = await _eventsQueue.peek;
        f != future;
        f = await _eventsQueue.peek) {
      await await _eventsQueue.next;
    }

    if (_buffer.isEmpty) {
      _buffer.addAll(await _source.next);
    }
    final result = _buffer.removeFirst();

    completer.complete();
    await _eventsQueue.next;
    return result;
  }

  @override
  Future? cancel({bool immediate = false}) =>
      _source.cancel(immediate: immediate);

  @override
  CancelableOperation<S> cancelable<S>(
      Future<S> Function(StreamQueue<Byte> p1) callback) {
    throw UnsupportedError("Cancellable unsupported for a dechunker");
  }

  @override
  int get eventsDispatched => _eventCount;

  @override
  Future<bool> get hasNext async => await _source.hasNext || _buffer.isNotEmpty;

  @override
  Future<List<Byte>> lookAhead(int count) async {
    if (count > _buffer.length) {
      throw (ArgumentError("This chunk is shorter than $count elements"));
    }
    List<Byte> result = [];
    for (int i = 0; i < count; ++i) {
      result.add(_buffer.elementAt(i));
    }
    return result;
  }

  @override
  Future<Byte> get peek async {
    if (_buffer.isEmpty) {
      _buffer.addAll(await _source.next);
    }
    return _buffer.first;
  }

  @override
  Stream<Byte> get rest async* {
    try {
      while (true) {
        yield await next;
      }
    } on StateError {
      if (await _source.hasNext || _buffer.isNotEmpty) {
        rethrow;
      }
    }
  }

  Stream<Bytes> get restChunks async* {
    yield Bytes.fromList(_buffer.toList());
    yield* _source.rest;
  }

  @override
  Future<int> skip(int count) async => (await take(count)).length;

  @override
  StreamQueueTransaction<Byte> startTransaction() {
    throw UnsupportedError("Transactions unsupported on a dechunker");
  }

  @override
  Future<List<Byte>> take(int count) async {
    List<Byte> result = [];
    try {
      result.add(await next);
    } on StateError {
      if (await _source.hasNext || _buffer.isNotEmpty) {
        rethrow;
      }
    }
    return result;
  }

  @override
  Future<bool> withTransaction(
      Future<bool> Function(StreamQueue<Byte> p1) callback) {
    throw UnsupportedError("Transactions unsupported on a dechunker");
  }
}
