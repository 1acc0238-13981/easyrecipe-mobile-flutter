import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
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
            return ListTile(
              leading: ClipOval(
                child: Image.network(
                  recipe.image,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(recipe.title),
            );
          },
        );
      },
    );
  }
}
