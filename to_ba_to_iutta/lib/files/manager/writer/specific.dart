import 'package:to_ba_to_iutta/files/manager/writer/index.dart';
import 'package:to_ba_to_iutta/files/types/specific.dart';

class SpecificFileWriter extends FileWriter {
  SpecificFileWriter(String type) : super(SpecificFileTypeSet(type));
}
