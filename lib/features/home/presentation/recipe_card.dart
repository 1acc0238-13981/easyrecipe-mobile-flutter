import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const new({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(8),
            ),
            child: Image.network(
              recipe.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text('${recipe.rating}')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
