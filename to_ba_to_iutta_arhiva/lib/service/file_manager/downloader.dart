import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_ba_to_iutta/exception/os_expected_exception.dart';
import 'package:to_ba_to_iutta/service/file_manager/file_options.dart';

class Downloader {
  final FileOptions fileOptions;

  Downloader(this.fileOptions);

  Future<String?> get path async {
    Directory? downloads;
    if (Platform.isAndroid) {
      downloads = await getExternalStorageDirectory();
    } else {
      downloads = await getDownloadsDirectory();
    }

    String? pickerPath;
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      pickerPath = await FilePicker.platform.saveFile(
          dialogTitle: fileOptions.dialogTitle,
          fileName: fileOptions.filename,
          initialDirectory: fileOptions.initialDirectory,
          type: fileOptions.type,
          allowedExtensions: fileOptions.allowedExtensions,
          lockParentWindow: fileOptions.lockParentWindow);

      if (pickerPath == null) return null;
    }

    if (pickerPath != null) {
      return (await Directory(pickerPath).absolute.create(recursive: true))
          .path;
    }
    if (downloads != null) {
      String dirPath = (await downloads.absolute.create(recursive: true)).path;
      String filename;

      if (fileOptions.filename != null && fileOptions.filename!.isNotEmpty) {
        filename = fileOptions.filename!;
      } else {
        filename = 'output.txt';
      }

      int k = 1;
      while (File(join(dirPath, filename)).existsSync()) {
        String ext = extension(filename);
        String base = basenameWithoutExtension(filename);

        filename = base + (k++).toString() + ext;
      }

      return join(dirPath, filename);
    }
    throw OSExpectedException("Unable to find system downloads directory.");
  }

  Future<bool> saveAll(Uint8List data) async {
    final pathString = await path;
    if (pathString == null) return false;

    final File file = File(pathString);
    file.writeAsBytes(data, flush: true);
    return true;
  }
}
