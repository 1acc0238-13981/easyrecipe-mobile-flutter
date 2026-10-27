import 'package:easy_recipe/features/home/infrastructure/di/dependency_injection.dart';
import 'package:easy_recipe/features/onboarding/onboarding_page.dart';
import 'package:easy_recipe/core/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencies();
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
