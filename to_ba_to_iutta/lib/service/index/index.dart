import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/files/manager/reader/index.dart';
import 'package:to_ba_to_iutta/files/manager/writer/index.dart';
import 'package:to_ba_to_iutta/service/key_manager/index.dart';
import 'package:to_ba_to_iutta/service/algorithm/packager/index.dart';

abstract class Service {
  final inputController = TextEditingController();
  final outputController = TextEditingController();
  abstract final KeyManager keyManager;

  void dispose() {
    inputController.dispose();
    outputController.dispose();
    keyManager.dispose();
  }

  abstract final Pacakger packager;

  Bytes get inputBytes;
  Bytes get outputBytes;
  set outputBytes(Bytes value);

  abstract final FileReader reader;
  abstract FileWriter writer;

  static const _maxLengthAllowed = 102400; // KB
  // static const _maxLengthAllowed = 0; // KB

  Future serve(Future<bool> Function() defaultDownload) async {
    writer.revoke();
    outputController.text = "";

    late final Stream<Bytes> input;
    bool flag = false;

    if (reader.path == null) {
      Bytes converted = inputBytes;
      if (converted.length / 1024 > _maxLengthAllowed) flag = true;
      input = Stream.fromFuture(Future.value(converted));
    } else {
      if (await reader.file.length() / 1024 > _maxLengthAllowed) flag = true;
      input = reader.get;
    }
    final output = StreamQueue(work(StreamQueue(input)));
    await output.peek;
    if (writer.path == null && flag) {
      do {
        flag = flag && await defaultDownload();
      } while (flag && !await writer.choose);
    }

    if (writer.path != null) {
      await writer.put(output.rest);
      outputController.text = "File saved succesfully";
      writer.revoke();
    } else {
      outputController.text = "";
      Bytes result = Bytes(0);
      await for (final chunk in output.rest) {
        final newResult = Bytes(result.length + chunk.length);
        newResult.setRange(0, result.length, result);
        newResult.setRange(result.length, newResult.length, chunk);
        result = newResult;
      }
      outputBytes = result;
    }
  }

  Stream<Bytes> work(StreamQueue<Bytes> input);

  Future<bool> chooseInputFile() => reader.choose;

  void revokeInputFile() => reader.revoke();

  String? get inputFilePath => reader.filePath;

  Future<bool> downloadOutput() async {
    final result = await writer.choose;
    if (!result) return false;

    await writer.put(Stream.fromIterable([outputBytes]));
    writer.revoke();
    return true;
  }
}
