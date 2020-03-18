import 'package:flutter_sqlite/models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DogRepository {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, _) => db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'),
      version: 1,
    );
  }

  Future insert(Dog dog) async {
    final db = await database;
    await db.insert('dogs', dog.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future log() async {
    final db = await database;
    final query = await db.query('dogs');
    final dogs = List.generate(
      query.length,
      (idx) => Dog(
        id: query[idx]['id'],
        age: query[idx]['age'],
        name: query[idx]['name'],
      ),
    );

    print(dogs);
  }
}
