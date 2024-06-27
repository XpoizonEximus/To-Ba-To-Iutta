class AsyncResultException {
  final String message;

  AsyncResultException(this.message);

  @override
  String toString() {
    return message;
  }
}
