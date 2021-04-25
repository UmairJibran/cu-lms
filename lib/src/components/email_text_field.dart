import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required TextEditingController emailController,
  })   : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.disabled,
      autocorrect: false,
      enabled: true,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "you@example.com",
      ),
      validator: (value) {
        if (value == null)
          return "Please enter an email";
        else if (value.trim().isEmpty)
          return "Please enter an email";
        else if (value.trim().length < 5 ||
            !value.trim().contains("@") ||
            !value.trim().contains("."))
          return "Please Enter a valid email";
        else
          return null;
      },
    );
  }
}
