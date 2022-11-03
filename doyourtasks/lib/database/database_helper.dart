import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:doyourtasks/database/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'getyourtasksdone.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE getyourtasksdone(
        id INTEGER PRIMARY KEY,
        username TEXT,
        name TEXT,
        desc TEXT,
        done INTEGER
        
      )
    ''');
  }

  Future<List<User>> getTasks() async {
    Database db = await instance.database;
    var tasks = await db.query('getyourtasksdone', orderBy: 'name');
    List<User> taskList =
        tasks.isNotEmpty ? tasks.map((e) => User.fromMap(e)).toList() : [];

    return taskList;
  }

  Future<int> add(User item) async {
    Database db = await instance.database;
    return await db.insert('getyourtasksdone', item.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db
        .delete('getyourtasksdone', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(User item) async {
    Database db = await instance.database;
    return await db.update('getyourtasksdone', item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  Future<int?> getCount() async {
    Database db = await instance.database;
    var x = await db.rawQuery('SELECT COUNT(*) FROM getyourtasksdone');
    int? count = Sqflite.firstIntValue(x);
    print(count);
    return count;
  }
}
