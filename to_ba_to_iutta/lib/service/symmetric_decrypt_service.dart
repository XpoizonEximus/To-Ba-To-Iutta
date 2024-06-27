import 'dart:developer' as developer;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:synchronized/synchronized.dart';
import 'package:to_ba_to_iutta/cryptography/decryptor/index.dart';
import 'package:to_ba_to_iutta/cryptography/decryptor/symmetric.dart';
import 'package:to_ba_to_iutta/exception/async_result_exception.dart';
import 'package:to_ba_to_iutta/service/file_manager/downloader.dart';
import 'package:to_ba_to_iutta/service/file_manager/file_options.dart';
import 'package:to_ba_to_iutta/service/file_manager/uploader.dart';
import 'package:to_ba_to_iutta/service/index.dart';

class SymmetricDecryptService extends Service {
  SymmetricDecryptService()
      : super(
            downloader: Downloader(FileOptions()),
            uploader: Uploader(FileOptions()));

  String? _textKey;
  final Lock _textKeyLock = Lock();
  set key(String? value) {
    _textKeyLock.synchronized(() {
      _textKey = value;
    });
  }

  final Decryptor decryptor = SymmetricDecryptor();

  @override
  Future<void> processFile([bool bigData = false]) async {
    // TODO: implement processFile
    throw UnimplementedError();
  }

  @override
  Future<(String, bool)> getResultText([int maximumTextLength = 0]) async {
    if (maximumTextLength < 1) {
      maximumTextLength = Service.defaultMaximumResultTextLength;
    }

    return await resultLock.synchronized(() {
      if (result == null) return ("", false);

      final String text = utf8.decode(
          result!.sublist(0, min(maximumTextLength + 10, result!.length)));

      return (
        text.substring(0, min(maximumTextLength, text.length)),
        text.length > maximumTextLength
      );
    });
  }

  @override
  Future<void> processText(String input, [bool bigData = false]) async {
    developer.log(input);

    _textKeyLock.synchronized(() async {
      if (_textKey == null) {
        throw AsyncResultException("Text key not set.");
      }

      await resultLock.synchronized(() async {
        result = await decryptor.decrypt(
            Uint8List.fromList(base64Decode(input)),
            Uint8List.fromList(utf8.encode(_textKey!)));
        developer.log('$result');
      });
    });
  }
}
