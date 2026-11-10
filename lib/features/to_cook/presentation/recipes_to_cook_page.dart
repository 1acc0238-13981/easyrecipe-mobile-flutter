import 'package:easy_recipe/features/to_cook/domain/recipe_to_cook.dart';
import 'package:easy_recipe/features/to_cook/presentation/recipes_to_cook_view_model.dart';
import 'package:flutter/material.dart';

class RecipesToCookPage extends StatelessWidget {
  final RecipesToCookViewModel viewModel;
  const new({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        final String? errorMesage = viewModel.errorMessage;
        if (errorMesage != null) {
          return Center(child: Text(errorMesage));
        }

        final List<RecipeToCook> recipes = viewModel.recipes;
        if (recipes.isNotEmpty) {
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final RecipeToCook recipe = recipes[index];
              return Card(
                child: ListTile(
                  title: Text(recipe.name),
                  subtitle: Text(recipe.cuisine),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      viewModel.toggleRecipeToCook(recipe.id);
                    },
                  ),
                ),
              );
            },
          );
        }

        return Center(child: Text('Empty recipes to cook'));
      },
    );
  }
}
