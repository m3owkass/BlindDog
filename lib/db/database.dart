import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._internal();

  static final AppDatabase instance = AppDatabase._internal();

  static const String _dbName = 'blind_dog.db';
  static const int _dbVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (kIsWeb) {
      throw UnsupportedError('SQLite via sqflite is not supported on web in Blind Dog.');
    }

    final existing = _database;
    if (existing != null) {
      return existing;
    }

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, _dbName);

    return openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_entries (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT UNIQUE,
        mood INTEGER,
        energy INTEGER,
        focus INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE streak_state (
        id INTEGER PRIMARY KEY,
        lastRelapse TEXT,
        currentStreak INTEGER,
        bestStreak INTEGER
      )
    ''');

    await db.insert('streak_state', {
      'id': 1,
      'lastRelapse': null,
      'currentStreak': 0,
      'bestStreak': 0,
    });
  }

  Future<void> close() async {
    final db = _database;
    if (db == null) {
      return;
    }

    await db.close();
    _database = null;
  }
}
