import 'package:flutter/material.dart';
import 'package:project_mini/services.dart/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  // ✅ Khai báo controller trong StatelessWidget (final)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _ConfirmpasswordController =
      TextEditingController();

  void Function()? onTap;

  Register({super.key, required this.onTap});

  // login method
  void register(BuildContext context) {
    final auth = AuthService();

    // password match => create user
    if (_passwordController.text == _ConfirmpasswordController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }

      // password dont match
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(title: Text("Password don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // create a account
            Text(
              "Let's a create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
              focusNode: null,
            ),

            const SizedBox(height: 25),

            // pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              focusNode: null,
            ),
            const SizedBox(height: 25),

            // confirm pw textfield
            MyTextfield(
              hintText: "Confirm password",
              obscureText: true,
              controller: _ConfirmpasswordController,
              focusNode: null,
            ),

            const SizedBox(height: 30),

            // login button
            MyButton(text: "Register", onTap: () => register(context)),

            const SizedBox(height: 30),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(width: 10),

                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now ?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
