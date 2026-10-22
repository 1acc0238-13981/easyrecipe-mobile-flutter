import 'package:easy_recipe/onboarding_page.dart';
import 'package:easy_recipe/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MaterialTheme(textTheme).lightHighContrast(),
      darkTheme: MaterialTheme(textTheme).darkHighContrast(),
      home: Scaffold(body: OnboardingPage()),
    );
  }
}
