import 'dart:async';
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:synchronized/synchronized.dart';
import 'package:to_ba_to_iutta/exception/async_result_exception.dart';
import 'package:to_ba_to_iutta/service/file_manager/downloader.dart';
import 'package:to_ba_to_iutta/service/file_manager/uploader.dart';

abstract class Service {
  @protected
  Uint8List? result;

  @protected
  final Lock resultLock = Lock();

  final Uploader uploader;
  final Downloader downloader;

  static const int defaultMaximumResultTextLength = 5000;

  Service({required this.uploader, required this.downloader});

  Future<void> processText(String input, [bool bigData = false]);
  Future<void> processFile([bool bigData = false]);

  Future<(String, bool)> getResultText([int maximumTextLength = 0]);

  Future<bool> downloadResult() async {
    return resultLock.synchronized(() async {
      if (result == null) throw AsyncResultException("Empty result.");
      return await downloader.saveAll(result!);
    });
  }
}
