import 'package:easy_recipe/features/to_cook/application/get_recipes_to_cook_use_case.dart';
import 'package:easy_recipe/features/to_cook/application/toggle_recipe_to_cook_use_case.dart';
import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook.dart';
import 'package:flutter/foundation.dart';

class RecipesToCookViewModel extends ChangeNotifier {
  final GetRecipesToCookUseCase _getRecipes;
  final ToggleRecipeToCookUseCase _toggleRecipe;

  new({required this._getRecipes, required this._toggleRecipe}) {
    loadRecipesToCook();
  }

  List<RecipeToCook> recipes = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadRecipesToCook() async {
    isLoading = true;
    notifyListeners();

    try {
      recipes = await _getRecipes.execute();
      isLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
    }
    notifyListeners();
  }

  Future<void> toggleRecipeToCook(int id) async {
    await _toggleRecipe.execute(id);
    final List<RecipeToCook> updatedRecipes = await _getRecipes.execute();
    recipes = updatedRecipes;
    notifyListeners();
  }
}
