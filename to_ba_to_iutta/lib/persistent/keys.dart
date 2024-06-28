import 'dart:convert';

import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/database.dart';

class AsymmetricKeysProvider {
  final _database = DatabaseProvider();

  Future<Iterable<String>> get privates => _database.readKeys(false);
  Future<Iterable<String>> get publics => _database.readKeys(true);

  Future<Bytes?> getKey(String name) async {
    try {
      return utf8.encode(await _database.readKey(name));
    } on EmptyDatabaseException {
      return null;
    }
  }

  Future setKey(String name, Bytes value, bool public) async =>
      _database.writeKey(name, utf8.decode(value), public);
}
