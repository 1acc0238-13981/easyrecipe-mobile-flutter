import 'package:easy_recipe/core/di/dependency_injection.dart';
import 'package:easy_recipe/features/auth/presentation/login_view_model.dart';
import 'package:easy_recipe/features/onboarding/onboarding_page.dart';
import 'package:easy_recipe/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(
    BlocProvider(
      create: (BuildContext context) => getIt<LoginViewModel>(),
      child: const MainApp(),
    ),
  );
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
