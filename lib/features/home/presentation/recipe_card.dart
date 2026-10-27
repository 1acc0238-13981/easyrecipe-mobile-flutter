import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const new({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(recipe.image, width: double.infinity, height: 200),
          Text(recipe.title, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
