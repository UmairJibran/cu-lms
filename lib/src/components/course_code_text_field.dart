import 'package:flutter/material.dart';

class CourseCodeTextField extends StatelessWidget {
  const CourseCodeTextField({
    Key? key,
    required TextEditingController courseCodeController,
  })   : _courseCodeController = courseCodeController,
        super(key: key);

  final TextEditingController _courseCodeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _courseCodeController,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      enableSuggestions: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "358",
        labelText: "Course Code",
      ),
      validator: (value) {
        if (value == null)
          return "Please Enter Course Code";
        else if (value.trim().length <= 1)
          return "Please Enter a valid course code";
        else
          return null;
      },
    );
  }
}
