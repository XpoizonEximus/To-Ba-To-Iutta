import 'dart:async';
import 'dart:convert';

import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/database.dart';

class SettingsProvider {
  final _database = DatabaseProvider();

  final Stream<Byte> _defaults;
  final int _id;

  static const _symmetricId = 0;
  static const _asymmetricId = 1;

  SettingsProvider(bool isAsymmetric, this._defaults)
      : _id = isAsymmetric ? _asymmetricId : _symmetricId;

  Future<Bytes> get get async {
    Future<Bytes> value() async =>
        base64Decode(await _database.readSettings(_id));

    try {
      return await value();
    } on EmptyDatabaseException {
      await set(Bytes.fromList(await _defaults.toList()));
      return await value();
    }
  }

  Future set(Bytes value) async {
    assert(_id ==
        await _database.writeSettings(_id, base64Encode(value as List<int>)));
    return;
  }
}
