import 'dart:async';

import 'package:revenda_gas/app/database/migrations/migration_v1.dart';
import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static const DATABASE_NAME = 'todolist';
  static const VERSION = 1;
  static Connection _instance;
  Database _database;
  final _lock = Lock();

  factory Connection() {
    if (_instance == null) _instance = Connection._();

    return _instance;
  }

  Connection._();

  Future<Database> get instance async => await _openConnection();

  Future<Database> _openConnection() async {
    if (_database == null) {
      await _lock.synchronized(() async {
        if (_database == null) {
          var databasePath = await getDatabasesPath();
          var pathDatabase = join(databasePath, DATABASE_NAME);

          _database = await openDatabase(
            pathDatabase,
            version: VERSION,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
          );
        }
      });
    }
    return _database;
  }

  void closeConnection() {
    _database?.close();
    _database = null;
  }

  FutureOr<void> _onUpgrade(Database database, int oldVersion, int newVersion) {
    var batch = database.batch();
  }

  FutureOr<void> _onCreate(Database database, int version) async {
    var batch = database.batch();
    createV1(batch);
    batch.commit();
  }

  FutureOr<void> _onConfigure(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON');
  }
}
