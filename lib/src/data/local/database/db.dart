import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'search_history.db'),
        version: 1, onCreate: (db, version) {
      return db.execute('''
            CREATE TABLE IF NOT EXISTS searches(
              id  INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT
            );
            ''');
    });
  }
}
