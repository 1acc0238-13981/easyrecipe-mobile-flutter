import 'package:easy_recipe/features/favorites/domain/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;
  const new({required this.repository});

  Future<List<int>> execute() {
    return repository.getFavorites();
  }
}
