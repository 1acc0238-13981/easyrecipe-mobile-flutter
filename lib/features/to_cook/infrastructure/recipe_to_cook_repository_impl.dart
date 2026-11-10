import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook.dart';
import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook_repository.dart';
import 'package:easy_recipe/features/to_cook/infrastructure/remote/recipe_to_cook_api.dart';
import 'package:easy_recipe/features/to_cook/infrastructure/remote/recipe_to_cook_dto.dart';

class RecipeToCookRepositoryImpl implements RecipeToCookRepository {
  final RecipeToCookApi _api;

  const new({required this._api});

  @override
  Future<void> addRecipeToCook(int id) async {
    await _api.toggleRecipeToCook(id);
  }

  @override
  Future<List<RecipeToCook>> getRecipesToCook() async {
    final List<RecipeToCookDto> dtos = await _api.getRecipesToCook();
    return dtos
        .map(
          (dto) => RecipeToCook(
            id: dto.id,
            name: dto.name,
            image: dto.image,
            cuisine: dto.cuisine,
            addedAt: DateTime.parse(dto.addedAt),
          ),
        )
        .toList();
  }

  @override
  Future<void> removeRecipeToCook(int id) async {
    await _api.toggleRecipeToCook(id);
  }
}
