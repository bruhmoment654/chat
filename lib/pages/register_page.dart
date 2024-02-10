import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final VoidCallback onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await auth.signUp(_emailController.text, _passwordController.text);
      } catch (e) {
        if (!context.mounted) return;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.message,
              size: 60,
            ),

            const SizedBox(
              height: 50,
            ),

            //welcome back message
            const Text(
              'Let\'s create an account',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(
              height: 25,
            ),

            //email
            MyTextField(
              hintText: 'Email',
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            //password
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(
              height: 25,
            ),

            //login button
            MyButton(text: 'Register', onPressed: () => {register(context)}),

            const SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Login now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
