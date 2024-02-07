import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField(
      {super.key, this.hintText = '', this.obscureText = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme
                    .of(context)
                    .colorScheme
                    .secondary)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme
                    .of(context)
                    .colorScheme
                    .primary)),
            fillColor: Theme
                .of(context)
                .colorScheme
                .secondaryContainer,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
