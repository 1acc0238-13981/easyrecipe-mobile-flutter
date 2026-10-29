import 'package:sqflite/sqflite.dart';

class FavoriteDao {
  final Database database;

  const new({required this.database});

  Future<List<int>> getFavorites() async {
    List maps = await database.query('favorites');
    return maps.map((map) => map['id'] as int).toList();
  }

  Future<void> addFavorite(int id) async {
    await database.insert('favorites', {'id': id});
  }

  Future<void> removeFavorite(int id) async {
    await database.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
