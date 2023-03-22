import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/task_model.dart';

class DBService {
  static const int _version = 1;
  static const String _dbName = 'myData1.db';
  static const String table_name = 'tasks11';

  Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, _version) async => await db.execute(
        "CREATE TABLE tasks11(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, date TEXT, importance_level TEXT, bg_color TEXT)",
      ),
      version: _version,
    );
  }

  Future<int?> addTask(Task task) async {
    final db = await _getDB();
    try {
      // print("tamam");
      // print(task.toJson());

      final map = task.toJson();
      return await db.insert(
        table_name,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<int> deleteTask(int id) async {
    final db = await _getDB();
    return await db.delete(
      table_name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Task>?> getAllTask() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(table_name);
    if (maps.isEmpty) {
      return [];
    }

    return List.generate(maps.length, (index) => Task.fromJson(maps[index]));
  }

  Future<int> updateColor({
    required int id,
    required String new_color,
  }) async {
    final db = await _getDB();
    return await db.update(
      table_name,
      {'bg_color': new_color},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
