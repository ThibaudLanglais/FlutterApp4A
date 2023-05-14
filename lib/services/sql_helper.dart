import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE mangas(
        mal_id INTEGER PRIMARY KEY NOT NULL,
        title TEXT,
        synopsis TEXT,
        image_url TEXT
      )""");
  }

  static Future<void> dropTables(Database database) async {
    await database.execute('DROP TABLE IF EXISTS mangas');
  }

  static Future<Database> db() async {
    return await sql.openDatabase(
      'truc.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await createTables(db);
      },
    );
  }

  static Future<void> destroy() async {
    // await sql.deleteDatabase("truc.db");
    sql.databaseExists("truc.db").then((value) => print(value));
  }

  static Future<int> insertManga(Map<String, dynamic> manga) async {
    final Database database = await db();

    final id = await database.insert(
        'mangas',
        {
          "mal_id": manga['mal_id'],
          "title": manga['title'],
          "synopsis": manga['synopsis'],
          "image_url": manga['image_url']
        },
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getMangas() async {
    final Database database = await db();
    return await database.query('mangas');
  }

  static Future<void> deleteManga(int malId) async {
    final Database database = await db();
    await database.delete('mangas', where: 'mal_id = ?', whereArgs: [malId]);
  }

  static Future<void> deleteAllMangas() async {
    final Database database = await db();
    await database.delete('mangas');
  }

  static Future<void> updateManga(Map<String, dynamic> manga) async {
    final Database database = await db();
    await database.update('mangas', manga,
        where: 'mal_id = ?', whereArgs: [manga['mal_id']]);
  }

  static Future<Map<String, dynamic>> getManga(int malId) async {
    final Database database = await db();
    final List<Map<String, dynamic>> result =
        await database.query('mangas', where: 'mal_id = ?', whereArgs: [malId]);
    if (result.isEmpty) {
      return {};
    } else {
      return result.first;
    }
  }
}
