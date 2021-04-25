import 'package:flutter/material.dart';

class GeneratedPasswordTextField extends StatelessWidget {
  const GeneratedPasswordTextField({
    Key? key,
    required String password,
  })   : _password = password,
        super(key: key);

  final String _password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(labelText: _password),
    );
  }
}
