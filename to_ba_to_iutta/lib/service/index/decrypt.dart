import 'dart:convert';

import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/files/manager/reader/cryptographic.dart';
import 'package:to_ba_to_iutta/files/manager/writer/specific.dart';
import 'package:to_ba_to_iutta/service/index/index.dart';
import 'package:to_ba_to_iutta/files/manager/writer/index.dart';
import 'package:to_ba_to_iutta/files/manager/reader/index.dart';

mixin DecryptService on Service {
  @override
  FileReader reader = CryptographicFileReader();
  @override
  FileWriter writer = SpecificFileWriter("txt");

  @override
  Bytes get inputBytes => base64Decode(inputController.text);
  @override
  Bytes get outputBytes => utf8.encode(outputController.text);
  @override
  set outputBytes(Bytes value) => outputController.text = utf8.decode(value);

  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    final byteInput = DechunkedStreamQueue(input);
    final type = await byteInput.next;
    if (type != 0) {
      final name = utf8.decode(await const BytesSerializer().load(byteInput));
      writer = SpecificFileWriter(extension(name));
      writer.name = name;
      if (!await writer.choose) {
        throw Exception(
            "The ciphertext holds a file. Please select a file for output when decrypting.");
      }
    }
    yield* byteInput.restChunks;
  }
}
