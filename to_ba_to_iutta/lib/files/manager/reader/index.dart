import 'package:file_picker/file_picker.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/files/manager/index.dart';

class FileReader extends FileManager {
  FileReader(super.types);

  @override
  Future<bool> get choose async {
    final result = await FilePicker.platform.pickFiles(
        dialogTitle: "Open",
        allowedExtensions: types.types.toList(),
        allowMultiple: false,
        lockParentWindow: true);
    if (result == null) return false;
    filePath = result.files.single.path!;
    return true;
  }

  Stream<Bytes> get get async* {
    await for (final chunk in file.openRead()) {
      yield Bytes.fromList(chunk);
      await Future.delayed(Duration.zero);
    }
  }
}
