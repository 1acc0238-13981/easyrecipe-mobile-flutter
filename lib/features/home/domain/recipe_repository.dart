import 'package:easy_recipe/features/home/domain/recipe.dart';

abstract class RecipeRepository {

  Future<List<Recipe>> getRecipes();
}