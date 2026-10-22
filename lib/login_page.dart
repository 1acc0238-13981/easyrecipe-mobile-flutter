import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Email"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Password"),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: () {}, child: Text('Sign in')),
            ),
          ),
        ],
      ),
    );
  }
}
