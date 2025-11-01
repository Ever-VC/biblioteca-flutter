import 'package:myapp/database/databases.dart';
import 'package:myapp/models/author.dart';

class AuthorProvider {
  final SqliteDatabase _database = SqliteDatabase();

  Future<void> insertAuthor(Author author) async {
    final db = await _database.database;
    db.insert('author', author.toMap());
  }

  Future<List<Author>> getAllAuthors() async {
    final db = await _database.database;
    final List<Map<String, dynamic>> lstMaps = await db.query('author');
    return lstMaps.map((map) => Author.fromMap(map)).toList();
  }
}