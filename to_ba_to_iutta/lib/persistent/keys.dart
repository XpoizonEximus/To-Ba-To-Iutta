import 'dart:convert';

import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/database.dart';

class AsymmetricKeysProvider {
  final _database = DatabaseProvider();

  Future<Iterable<String>> get privates => _database.readKeys(false);
  Future<Iterable<String>> get publics => _database.readKeys(true);

  Future<Bytes?> getKey(String name, bool public) async {
    try {
      return base64Decode(await _database.readKey(name, public));
    } on EmptyDatabaseException {
      return null;
    }
  }

  Future setKey(String name, Bytes? value, bool public) async => _database
      .writeKey(name, value == null ? null : base64Encode(value), public);
}
