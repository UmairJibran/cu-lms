import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key? key,
    required TextEditingController usernameController,
  })   : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      autovalidateMode: AutovalidateMode.disabled,
      enabled: true,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "This can be your employee ID/Email",
        suffixIcon: Icon(Icons.person_outline_rounded),
      ),
      validator: (value) {
        if (value == null)
          return "Username Cannot be empty";
        else if (value.trim().isEmpty)
          return "Space can not be username";
        else if (value.trim().length < 4)
          return "Username's length must be at least 4 characters";
        else
          return null;
      },
    );
  }
}
