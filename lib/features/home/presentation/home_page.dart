import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:easy_recipe/features/home/presentation/recipe_card.dart';
import 'package:easy_recipe/features/home/presentation/recipe_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  const new({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        final viewModel = widget.viewModel;
        if (viewModel.isLoading) {
          return CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: viewModel.recipes.length,
          itemBuilder: (context, index) {
            final recipe = viewModel.recipes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipe),
                  ),
                );
              },
              child: RecipeCard(recipe: recipe),
            );
          },
        );
      },
    );
  }
}
