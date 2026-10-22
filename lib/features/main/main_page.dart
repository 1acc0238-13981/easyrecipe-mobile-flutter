import 'package:easy_recipe/features/home/application/get_recipes_use_case.dart';
import 'package:easy_recipe/features/home/domain/recipe_repository.dart';
import 'package:easy_recipe/features/home/infrastructure/recipe_repository_impl.dart';
import 'package:easy_recipe/features/home/presentation/home_page.dart';
import 'package:easy_recipe/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPagState();
}

class _MainPagState extends State<MainPage> {
  int selectedIndex = 0;
  late RecipeRepository repository;
  late GetRecipesUseCase useCase;
  late HomeViewModel viewModel;

  late List<Widget> pages = [
  
  ];

  @override
  void initState() {
    super.initState();
    repository = RecipeRepositoryImpl();
    useCase = GetRecipesUseCase(repository: repository);
    viewModel = HomeViewModel(getRecipesUseCase: useCase);
    
    pages = [HomePage(viewModel: viewModel), Text("Favorites"), Text("Cart")];
  }

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
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
