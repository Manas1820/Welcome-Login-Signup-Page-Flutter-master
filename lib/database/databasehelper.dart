import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  //".db" is compulsory as a file type
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';

  //making it a singleton class
  DatabaseHelper._privateconstructor();
  static final DatabaseHelper instance =
      new DatabaseHelper._privateconstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    //to get the folder location of the app on smartphone
    Directory directory = await getApplicationDocumentsDirectory();
    //directory + file name = path
    String path = join(directory.path, _dbName);
    //to open the database along with the parameters
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) {
    //three single quotes to write string in multiple lines
    db.execute('''
    CREATE TABLE $_tableName (
     $columnId INTEGER PRIMARY KEY ,  
     $columnName TEXT NOT NULL)
    ''');
  }

//return id of the entered row
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

//return number of rows updated
  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];

    /* will be replaced by respective whereArgs list 
    Eg:- '$_columnId=? $_columnName = ?', whereArgs: [1 -> for first question mark ,'tanmay' -> for second question mark]
    */

    return await db
        .update(_tableName, row, where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}

//Insert , Delete , Update ,Query , are the commands of sqflite package
