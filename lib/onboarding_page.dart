import 'package:easy_recipe/login_page.dart';
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

        Padding(
          padding: const EdgeInsets.only(bottom: 32),
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
    );
  }
}
