import 'package:easy_recipe/features/favorites/domain/favorite_repository.dart';
import 'package:easy_recipe/features/favorites/infrastructure/favorite_dao.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDao dao;
  const new({required this.dao});

  @override
  Future<void> addFavorite(int id) async {
    await dao.addFavorite(id);
  }

  @override
  Future<void> removeFavorite(int id) async {
    await dao.removeFavorite(id);
  }

  @override
  Future<List<int>> getFavorites() async {
    return await dao.getFavorites();
  }
}
