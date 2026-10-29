import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database>? _database;

  Future<Database> get database => _database ??= _openDatabase();

  Future<Database> _openDatabase() async {
    final path = join(await getDatabasesPath(), 'easyrecipe_db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('create table favorites (id integer primary key)');
    },);
  }
}