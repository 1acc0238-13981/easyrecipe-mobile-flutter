import 'package:easy_recipe/features/home/domain/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const new({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onToggleFavorite,
  });
  final Recipe recipe;
  final bool isFavorite;
  final Function() onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: recipe.id,
                child: ClipRRect(
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
              ),
              Align(
                alignment: AlignmentGeometry.topEnd,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: IconButton(
                        onPressed: () => onToggleFavorite(),
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                    Text('${recipe.rating}'),
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
