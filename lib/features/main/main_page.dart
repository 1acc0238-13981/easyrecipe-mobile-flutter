import 'package:easy_recipe/core/di/dependency_injection.dart';
import 'package:easy_recipe/features/favorites/presentation/favorites_page.dart';
import 'package:easy_recipe/features/home/presentation/home_page.dart';
import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:easy_recipe/features/to_cook/presentation/recipes_to_cook_page.dart';
import 'package:easy_recipe/features/to_cook/presentation/recipes_to_cook_view_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPagState();
}

class _MainPagState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(viewModel: getIt<HomeViewModel>()),
    FavoritesPage(viewModel: getIt<HomeViewModel>()),
    RecipesToCookPage(viewModel: getIt<RecipesToCookViewModel>()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          NavigationDestination(
            icon: Icon(Icons.soup_kitchen),
            selectedIcon: Icon(Icons.soup_kitchen_outlined),
            label: "To cook",
          ),
        ],
      ),
    );
  }
}
