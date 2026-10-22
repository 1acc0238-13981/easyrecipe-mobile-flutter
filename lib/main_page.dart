import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPagState();
}

class _MainPagState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [Text("Home"), Text("Favorites"), Text("Cart")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites")
        ],
      ),
    );
  }
}
