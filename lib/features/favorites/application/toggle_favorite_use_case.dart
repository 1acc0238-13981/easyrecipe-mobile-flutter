import 'package:easy_recipe/features/favorites/domain/favorite_repository.dart';

class ToggleFavoriteUseCase {
  final FavoriteRepository repository;
  const new({required this.repository});

  Future<void> execute(int id) async {
    final List ids = await repository.getFavorites();

    ids.contains(id)
        ? repository.removeFavorite(id)
        : repository.addFavorite(id);
  }
}
