import 'dart:io';
import 'package:path/path.dart';

import 'package:to_ba_to_iutta/files/types/index.dart';

abstract class FileManager {
  String? filePath;
  final FileTypeSet types;
  FileManager(this.types);

  Future<bool> get choose;
  File get file => File(path!);
  String? get path => filePath;
  void revoke() => filePath = null;
  String get name => basenameWithoutExtension(path!);
  String get type => extension(path!);
}
