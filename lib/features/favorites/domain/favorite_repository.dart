abstract class FavoriteRepository {
  Future<List<int>> getFavorites();
  Future<void> addFavorite(int id);
  Future<void> removeFavorite(int id);
}