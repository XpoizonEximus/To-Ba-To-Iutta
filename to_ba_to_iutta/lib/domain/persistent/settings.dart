import 'dart:async';
import 'dart:convert';

import 'package:to_ba_to_iutta/domain/digest/index.dart';
import 'package:to_ba_to_iutta/domain/persistent/database.dart';

class SettingsProvider {
  final _database = DatabaseProvider();

  final _symmetricId = 0;

  Future<DigestData> get _symmetric async =>
      const DigestDataSerializer().load(Stream.fromIterable(
          utf8.encode(await _database.readSettings(_symmetricId))));
  Future<DigestData> get symmetric async {
    try {
      return await _symmetric;
    } catch (e) {
      if (e is EmptyDatabaseException) {
        await setSymmetric(DigestData.defaults);
        return await _symmetric;
      } else {
        rethrow;
      }
    }
  }

  Future<void> setSymmetric(DigestData value) async {
    assert(_symmetricId ==
        await _database.writeSettings(
            _symmetricId,
            utf8.decode(
                await const DigestDataSerializer().serialize(value).toList())));
  }
}
