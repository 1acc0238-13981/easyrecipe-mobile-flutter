import 'package:easy_recipe/features/auth/presentation/login_state.dart';
import 'package:easy_recipe/features/auth/presentation/login_view_model.dart';
import 'package:easy_recipe/features/auth/presentation/password_text_field.dart';
import 'package:easy_recipe/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  new({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Email"),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: PasswordTextField(controller: password),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        context.read<LoginViewModel>().signIn(
                          email.text,
                          password.text,
                        );
                      },
                      child: Text('Sign in'),
                    ),
                  ),
                ),
              ],
            ),

            if (state is LoginLoading)
              Container(
                color: Theme.of(context).colorScheme.surface.withAlpha(200),
                child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
