import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static DataBaseHelper dbh = DataBaseHelper._();

  Database? database;
  String? tName = "category";
  String? cName = "category_name";

  Future<void> initdb() async {
    String path = await getDatabasesPath();
    String fpath = "${path}budget_tracker.db";

    database = await openDatabase(
      fpath,
      version: 1,
      onCreate: (db, _) async {
        String q = '''CREATE TABLE $tName (
        category_id INTEGER PRIMARY KEY AUTOINCREMENT,
        $cName TEXT NOT NULL
        );''';
        await db.execute(q).then(
          (value) {
            log("Category table is created....");
          },
        ).onError(
          (error, _) {
            log("Caregory table is creation failed  $error....");
          },
        );
      },
    );
  }

  Future<int?> insertData(String name) async {
    await initdb();
    String q = "INSERT INTO $tName ($cName) VALUES(?)";
    return await database?.rawInsert(q, [name]);
  }
}
