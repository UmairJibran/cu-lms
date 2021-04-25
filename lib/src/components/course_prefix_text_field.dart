import 'package:flutter/material.dart';

class CoursePrefixTextField extends StatelessWidget {
  const CoursePrefixTextField({
    Key? key,
    required TextEditingController coursePrefixController,
  })   : _coursePrefixController = coursePrefixController,
        super(key: key);

  final TextEditingController _coursePrefixController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _coursePrefixController,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      enableSuggestions: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "CSC",
        labelText: "Course Prefix",
      ),
      validator: (value) {
        if (value == null)
          return "Please Enter Course Prefix";
        else if (value.trim().length == 0 || value.trim().length < 3)
          return "Please Enter a valid course Prefix with minimum length of 3 characters";
        else
          return null;
      },
    );
  }
}
