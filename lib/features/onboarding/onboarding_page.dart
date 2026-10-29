import 'package:easy_recipe/features/auth/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        Image.asset(
          "assets/images/background.png",
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.shadow.withAlpha(120),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                
                children: [
                  Text(
                    "Welcome to Easy Recipe",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
