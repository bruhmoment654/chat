import 'package:chat/services/auth/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void register(BuildContext context) async {
    final auth = AuthService();

    try {
      await auth.signUp(_emailController.text, _passwordController.text);
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //           title: Text(e.toString()),
      //         ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
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
                'Let\'s create an account',
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
                validator: (value) =>
                (value == null || value == '') ? 'Required field' : null,
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),

              const SizedBox(
                height: 10,
              ),

              MyTextField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Required field';
                  }
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    return 'Passwords must be same';
                  }
                  return null;
                },
                hintText: 'Confirm password',
                obscureText: true,
                controller: _confirmPasswordController,
              ),

              const SizedBox(
                height: 25,
              ),

              //login button
              MyButton(text: 'Register', onPressed: () {
                if (_formKey.currentState!.validate()) {
                  register(context);
                }
              }),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: widget.onTap,
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
      ),
    );
  }
}
