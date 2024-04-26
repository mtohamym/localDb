import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {

  static Future<Database> initDb() async {
    return sql.openDatabase(
      'foods.db', //database name
      version: 1, //version number
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE foods(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT
      )
      """);
    debugPrint("table Created");
  }


  //add
  static Future<int> add(String title, String descrption) async {
    final db = await SQLHelper.initDb(); //open database
    final data = {'title': title, 'description': descrption}; //create data in map
    final id = await db.insert('foods', data);  //insert
    debugPrint("Data Added");
    return id;
  }

//read all data
  static Future<List<Map<String, dynamic>>> get() async {
    final db = await SQLHelper.initDb();
    return db.query('foods', orderBy: "id");
  }


  //get data by id
  static Future<List<Map<String, dynamic>>> getById(int id) async {
    final db = await SQLHelper.initDb();
    return db.query('foods', where: "id = ?", whereArgs: [id]);
  }

  /// id = ? , title = ?


  //update
  static Future<int> update(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.initDb();
    final data = {
      'title': title,
      'description': descrption,
    };

    final result =
    await db.update('foods', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> delete(int id) async {
    final db = await SQLHelper.initDb();
    try {
      await db.delete("foods", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when : $err");
    }
  }
}