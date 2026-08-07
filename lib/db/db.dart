// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  DB database = DB.getInstance;

  bool added = await database.addNote(userTitle: "hero", userDesc: "zero");

  print("Added: $added");

  List<Map<String, dynamic>> data = await database.getAllData();

  print(data);
}

class DB {
  String TABLE_NOTE = "information";
  String COLUMN_NOTE_SN = "SN";
  String COLUMN_NOTE_TITLE = "title";
  String COLUMN_NOTE_DESC = "des";

  DB._();

  //from this instance we can call or access the variable and method
  static DB getInstance = DB._();

  Database? _database;

  Future<Database> getDatabase() async {
    _database = _database ?? await openDb();
    return _database!;
  }

  Future<Database> openDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = join(appDir.path, "userData.db");

    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        //we are creating the table here
        db.execute(
          "create table $TABLE_NOTE($COLUMN_NOTE_SN integer primary key autoincrement ,$COLUMN_NOTE_TITLE text , $COLUMN_NOTE_DESC text)",
        );
      },
      version: 1,
    );
  }

  ///queries part

  Future<bool> addNote({
    required String userTitle,
    required String userDesc,
  }) async {
    var db = await getDatabase();

    int rowsAffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: userTitle,
      COLUMN_NOTE_DESC: userDesc,
    });

    return rowsAffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    var db = await getDatabase();

    List<Map<String, dynamic>> data = await db.query(TABLE_NOTE);

    return data;
  }
}
