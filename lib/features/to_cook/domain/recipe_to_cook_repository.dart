import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook.dart';

abstract class RecipeToCookRepository {
  Future<List<RecipeToCook>> getRecipesToCook();
  Future<void> addRecipeToCook(int id);
  Future<void> removeRecipeToCook(int id);
}
