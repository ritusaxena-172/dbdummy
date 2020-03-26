import 'package:dbdummy/model/sqflite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbDog {
  Database _database;
  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "MyApp.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            " CREATE TABLE DataApp( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age TEXT, breed TEXT)");
      });
    }
    // else
    // {
    //   DROP TABLE [ IF EXISTS ] dog;
    //   await _database.query("DROP TABLE [ IF EXISTS ] dog");
    //   print('table is delted');
    // }
  }

  Future<int> insertDog(Dog dog) async {
    await openDb();
    return await _database.insert('DataApp', dog.toMap());
    // conflictAlgorithm: ConflictAlgorithm.replace,
  }
  

  Future<List<Dog>> getDogList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('DataApp');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        age: maps[i]['age'],
        name: maps[i]['name'],
        breed: maps[i]['breed'],
      );
    });
  }
}

