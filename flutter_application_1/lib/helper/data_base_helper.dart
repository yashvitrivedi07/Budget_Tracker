import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper dbh = DataBaseHelper._();
  DataBaseHelper._();
  Database? database;
  String? tName = "category";
  String? cName = "category_name";

  void initdb() async {
    String path = await getDatabasesPath();
    String fpath = "${path}budget_tracker.db";

    database = await openDatabase(
      fpath,
      version: 1,
      onCreate: (db, _) {
        String q = '''CREATE TABLE $tName (
        category_id INTEGER PRIMARY KEY,
        $cName TEXT NOT NULL,
        )''';
        database?.execute(q);
      },
    );
  }

  Future<Future<int>?> insertData(String name) async {
    initdb();
    String q = "INSERT INTO $tName ($cName) Values(?)";
    return database?.rawInsert(q, [name]);
  }
}
