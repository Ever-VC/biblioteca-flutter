import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDatabase {
  static Database? _database;
  static final SqliteDatabase _inatance = SqliteDatabase._internal();
  String dbName = 'library.db';

  factory SqliteDatabase() => _inatance;

  SqliteDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String src = await getDatabasesPath();
    String path = join(src, dbName);
    return openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE author (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        nationality TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE book (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        publicationYear TEXT NOT NULL,
        id_author INTEGER NOT NULL,
        FOREIGN KEY (id_author) REFERENCES author(id) ON DELETE CASCADE
      )
    ''');
  }
}
