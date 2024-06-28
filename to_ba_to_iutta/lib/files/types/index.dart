class FileTypeSet {
  final Iterable<String> types;

  FileTypeSet(this.types) {
    if (types.isEmpty) {
      throw ArgumentError("Invalid file set - list of type must not be empty");
    }
  }
}
