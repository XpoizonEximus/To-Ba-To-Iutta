import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/digest/index.dart';
import 'package:to_ba_to_iutta/persistent/database.dart';

class SettingsProvider {
  final _database = DatabaseProvider();

  final _symmetricId = 0;

  Future<CipherData> get _symmetric async =>
      CipherDataSerializer().load(StreamQueue(Stream.fromIterable(
          utf8.encode(await _database.readSettings(_symmetricId)))));

  Future<CipherData> get symmetric async {
    try {
      return await _symmetric;
    } catch (e) {
      if (e is EmptyDatabaseException) {
        await setSymmetric(CipherData.defaults);
        return await _symmetric;
      } else {
        rethrow;
      }
    }
  }

  Future<void> setSymmetric(CipherData value) async {
    assert(_symmetricId ==
        await _database.writeSettings(
            _symmetricId,
            utf8.decode(
                await CipherDataSerializer().serialize(value).toList())));
  }
}
