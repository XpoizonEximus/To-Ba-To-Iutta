import 'dart:convert';

import 'package:async/async.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/files/manager/reader/all.dart';
import 'package:to_ba_to_iutta/files/manager/reader/index.dart';
import 'package:to_ba_to_iutta/files/manager/writer/cryptographic.dart';
import 'package:to_ba_to_iutta/files/manager/writer/index.dart';
import 'package:to_ba_to_iutta/service/index/index.dart';

mixin EncryptService on Service {
  @override
  FileReader reader = AllFileReader();
  @override
  FileWriter writer = CryptographicFileWriter();

  @override
  Bytes get inputBytes => utf8.encode(inputController.text);
  @override
  Bytes get outputBytes => base64Decode(outputController.text);
  @override
  set outputBytes(Bytes value) => outputController.text = base64Encode(value);

  @override
  Stream<Bytes> work(StreamQueue<Bytes> input) async* {
    if (reader.path == null) {
      yield Bytes.fromList([0]);
    } else {
      yield Bytes.fromList([1]);
      yield Bytes.fromList(
          await (const BytesSerializer().serialize(utf8.encode(reader.name)))
              .toList());
    }
    yield* input.rest;
  }
}
