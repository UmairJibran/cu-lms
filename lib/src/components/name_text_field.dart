import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    required TextEditingController nameController,
  })   : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      autovalidateMode: AutovalidateMode.disabled,
      autocorrect: true,
      enabled: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "John Doe",
      ),
      validator: (value) {
        if (value == null)
          return "Please enter a name";
        else if (value.trim().isEmpty)
          return "Please enter a name";
        else if (value.trim().length < 3)
          return "Please Enter a valid name";
        else
          return null;
      },
    );
  }
}
