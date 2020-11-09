import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_hms');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database db, int version) async {
    await db.execute("""
        CREATE TABLE patients (id INTEGER PRIMARY KEY, name TEXT , disease TEXT)
CREATE TABLE patients (id INTEGER PRIMARY KEY, name TEXT , degree TEXT,contact TEXT)        
        """);
  }
}
