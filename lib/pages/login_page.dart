import 'package:flutter/material.dart';
import 'package:project_mini/services.dart/auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  // Khai báo controller trong StatelessWidget (final)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try again
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Error"), content: Text(e.toString())),
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

            // welcome back message
            Text(
              "Welcome back, you've been missed!",
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

            // login button
            const SizedBox(height: 30),

            MyButton(text: "Login", onTap: () => login(context)),

            const SizedBox(height: 30),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
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
