import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:easy_recipe/features/home/presentation/recipe_card.dart';
import 'package:easy_recipe/features/home/presentation/recipe_detail_page.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final HomeViewModel viewModel;
  const new({super.key, required this.viewModel});



  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: viewModel.favorites.length,
          itemBuilder: (context, index) {
            final recipe = viewModel.favorites[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
              child: RecipeCard(
                recipe: recipe,
                isFavorite: viewModel.isFavorite(recipe.id),
                onToggleFavorite: () {
                  viewModel.toggleFavoriteRecipe(recipe.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
