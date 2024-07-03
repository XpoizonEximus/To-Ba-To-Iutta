import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
    // if (Platform.isAndroid) {
    //   final directory = await getApplicationDocumentsDirectory();
    //   log(directory.path);
    //   // final directory = Directory("/storage/emulated/0/");
    //   filePath = "${directory.path}/text.k";
    //   return true;
    // }

    if (Platform.isIOS) {
      filePath = "${(await getDownloadsDirectory())?.path}/crypt.k";
      return true;
    }

    final type = Platform.isWindows ? FileType.custom : FileType.any;

    filePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save',
        fileName: _name,
        allowedExtensions:
            type == FileType.custom ? types.types.toList() : null,
        type: type,
        // initialDirectory: (await getApplicationDocumentsDirectory()).path,
        bytes: Bytes.fromList([0]),
        lockParentWindow: true);

    return filePath != null;
  }

  Future put(Stream<Bytes> data) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // final f = await file.open(mode: FileMode.write);
      final directory = await getApplicationDocumentsDirectory();
      final originalPath = "${directory.path}/encrypted.k";
      final f = await File(originalPath).open(mode: FileMode.write);
      try {
        await for (final chunk in data) {
          await f.writeFrom(chunk);
        }
      } finally {
        await f.close();
        // log((await File(originalPath).length()).toString()); // functioneaza
        log(originalPath);
        log(path!);
        if (!Platform.isIOS) {
          final originalFile = File(originalPath);
          try {
            if (!await file.exists()) {
              await file.create(recursive: true);
            }
            await originalFile.copy(path!);
          } catch (e) {
            rethrow;
          }
        }
      }
    } else {
      await openAppSettings();
      throw StateError("Permission to storage denied");
    }
  }
}
