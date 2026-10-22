import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository repository;

  const GetRecipesUseCase({required this.repository});

  Future<List<Recipe>> execute() async {
    return repository.getRecipes();
  }
}
