import 'package:easy_recipe/features/home/application/get_recipes_use_case.dart';
import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetRecipesUseCase getRecipesUseCase;

  HomeViewModel({required this.getRecipesUseCase});

  List<Recipe> recipes = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await getRecipesUseCase.execute();
    isLoading = false;
    notifyListeners();
  }
}
