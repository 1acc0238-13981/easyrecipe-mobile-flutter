import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';
import 'package:easy_recipe/features/home/infrastructure/remote/recipe_api.dart';
import 'package:easy_recipe/features/home/infrastructure/remote/recipe_dto.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeApi api;

  new({required this.api});

  @override
  Future<List<Recipe>> getRecipes() async {
    List<RecipeDto> dtos = await api.getRecipes();

    return dtos
        .map(
          ((e) => Recipe(
            id: e.id,
            title: e.name,
            image: e.image,
            rating: e.rating,
          )),
        )
        .toList();
  }
}
