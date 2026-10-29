import 'package:easy_recipe/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_recipe/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_recipe/features/home/application/get_recipes_use_case.dart';
import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetRecipesUseCase getRecipes;
  final GetFavoritesUseCase getFavorites;
  final ToggleFavoriteUseCase toggleFavorite;

  HomeViewModel({
    required this.getRecipes,
    required this.getFavorites,
    required this.toggleFavorite,
  });

  bool isLoading = false;
  String? errorMessage;
  List<Recipe> recipes = [];
  List<int> favoriteIds = [];

  List<Recipe> get favorites =>
      recipes.where((recipe) => isFavorite(recipe.id)).toList();

  Future<void> loadRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await getRecipes.execute();
    favoriteIds = await getFavorites.execute();
    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavoriteRecipe(int id) async {
    await toggleFavorite.execute(id);

    isFavorite(id) ? favoriteIds.remove(id) : favoriteIds.add(id);
    notifyListeners();
  }

  bool isFavorite(int id) {
    return favoriteIds.contains(id);
  }
}
