import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabaseProvider {
  static const _version = 1;
  static const _dbName = "org.example.to-ba-to-iutta.db";
  static const _settings = "settings";

  final Future<Database> _database;

  static Future<Database> _openDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    return await openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (database, version) {
          return database.execute("""CREATE TABLE $_settings(
        id INTEGER PRIMARY KEY,
        value TEXT
        );""");
        },
        version: _version);
  }

  DatabaseProvider() : _database = _openDatabase();

  Future<int> writeSettings(int id, String value) async {
    final db = await _database;

    return await db.insert(_settings, {'id': id, 'value': value},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<String> readSettings(int id) async {
    final db = await _database;

    final list = (await db.query(_settings,
        where: "id = ?", whereArgs: [id], columns: ['value']));

    if (list.isEmpty) {
      throw EmptyDatabaseException("Unitialized settings with id $id");
    }

    return list[0]['value'] as String;
  }
}

class EmptyDatabaseException implements Exception {
  final String message;

  EmptyDatabaseException([this.message = "Database not initialized"]);

  @override
  String toString() => "EmptyDatabaseException: $message";
}
