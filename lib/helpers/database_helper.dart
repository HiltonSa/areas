import 'dart:io';

import 'package:areas/helpers/database_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initilizeDatabase();
    }
    return _database;
  }

  Future<Database> initilizeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'projetos.db';
    var projetosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return projetosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(DatabaseConstants.SqlCreateProjetos);
    await db.execute(DatabaseConstants.SqlCreateAmbientes);
    await db.execute(DatabaseConstants.SqlCreateParedes);
  }

  Future close() async {
    Database db = await this.database;
    db.close();
  }
}
