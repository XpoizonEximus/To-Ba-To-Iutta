import 'package:file_picker/file_picker.dart';

class FileOptions {
  final List<String>? allowedExtensions;
  final bool allowCompression;
  final String? dialogTitle;
  final String? initialDirectory;
  final bool lockParentWindow;
  late final FileType type;
  final bool useFullScreenDialog;
  final bool withReadStream;
  final String? filename;

  FileOptions(
      {this.allowedExtensions,
      this.allowCompression = true,
      this.dialogTitle,
      this.initialDirectory,
      this.lockParentWindow = true,
      FileType? type,
      this.useFullScreenDialog = false,
      this.withReadStream = true,
      this.filename}) {
    if (type != null) {
      this.type = type;
    } else {
      this.type = (allowedExtensions == null || allowedExtensions!.isEmpty
          ? FileType.any
          : FileType.custom);
    }
  }
}
