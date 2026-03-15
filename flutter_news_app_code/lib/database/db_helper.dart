import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  static Database? _db;

  Future<Database> get database async {

    if (_db != null) return _db!;

    _db = await initDB();
    return _db!;
  }

  initDB() async {

    String path = join(await getDatabasesPath(), "news.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {

        db.execute(
            "CREATE TABLE articles(title TEXT, description TEXT, image TEXT, source TEXT, date TEXT)");
      },
    );
  }

  insertArticle(Map<String, dynamic> data) async {

    final db = await database;

    await db.insert("articles", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getArticles() async {

    final db = await database;

    return db.query("articles");
  }
}