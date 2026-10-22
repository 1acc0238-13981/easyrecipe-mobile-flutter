import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    return [
      Recipe(
        id: 1,
        title: 'Classic Margherita Pizza',
        image: 'https://cdn.dummyjson.com/recipe-images/1.webp',
        rating: 4.6,
      ),
    ];
  }
}
