import 'dart:developer' as developer;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:synchronized/synchronized.dart';
import 'package:to_ba_to_iutta/cryptography/encryptor/index.dart';
import 'package:to_ba_to_iutta/cryptography/encryptor/symmetric.dart';
import 'package:to_ba_to_iutta/exception/async_result_exception.dart';
import 'package:to_ba_to_iutta/service/file_manager/downloader.dart';
import 'package:to_ba_to_iutta/service/file_manager/file_options.dart';
import 'package:to_ba_to_iutta/service/file_manager/uploader.dart';
import 'package:to_ba_to_iutta/service/index.dart';

class SymmetricEncryptService extends Service {
  SymmetricEncryptService()
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

  final Encryptor encryptor = SymmetricEncryptor();

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

      final String text = base64Encode(
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
        result = await encryptor.encrypt(Uint8List.fromList(utf8.encode(input)),
            Uint8List.fromList(utf8.encode(_textKey!)));

        developer.log('$result');
      });
    });
  }
}
