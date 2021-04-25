import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required TextEditingController passwordController,
  })   : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: true,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "**********",
        suffixIcon: Icon(Icons.lock_outline_rounded),
      ),
      validator: (value) {
        if (value == null)
          return "Password Cannot be empty";
        else if (value.isEmpty)
          return "Password Cannot be empty";
        else if (value.trim().length < 6)
          return "Password's length must be at least 6 characters";
        else
          return null;
      },
    );
  }
}
