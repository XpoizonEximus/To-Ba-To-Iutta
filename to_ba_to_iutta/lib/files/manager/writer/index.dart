import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/files/manager/index.dart';

class FileWriter extends FileManager {
  FileWriter(super.types);

  String? _name;

  set name(String value) {
    _name = value;
  }

  @override
  Future<bool> get choose async {
    filePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save',
        fileName: _name,
        allowedExtensions: types.types.toList(),
        bytes: Bytes.fromList([0]),
        lockParentWindow: true);

    return filePath != null;
  }

  Future put(Stream<Bytes> data) async {
    bool replaced = false;
    await for (final chunk in data) {
      await file.writeAsBytes(chunk,
          mode: replaced ? FileMode.writeOnlyAppend : FileMode.writeOnly);
      replaced = true;
    }
  }
}
