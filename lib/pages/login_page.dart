import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Form(
          key: _formKey,
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
                'Welcome back',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              //email
              MyTextField(
                validator: (value) {
                  if (value == null || value == '') return 'Required field';
                  return EmailValidator.validate(value)
                      ? null
                      : 'Invalid email';
                },
                hintText: 'Email',
                controller: _emailController,
              ),

              const SizedBox(
                height: 10,
              ),

              //password
              MyTextField(
                hintText: 'Password',
                validator: (value) =>
                    (value == null || value == '') ? 'Required field' : null,
                obscureText: true,
                controller: _passwordController,
              ),

              const SizedBox(
                height: 25,
              ),

              //login button
              MyButton(
                text: 'Login',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    login(context);
                  }
                },
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member? '),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
