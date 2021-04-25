import 'package:flutter/material.dart';

class CourseNameTextField extends StatelessWidget {
  const CourseNameTextField({
    Key? key,
    required TextEditingController courseNameController,
  })   : _courseNameController = courseNameController,
        super(key: key);

  final TextEditingController _courseNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _courseNameController,
      enabled: true,
      autovalidateMode: AutovalidateMode.disabled,
      enableSuggestions: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Intro to Computing",
        labelText: "Course Name",
      ),
      validator: (value) {
        if (value == null)
          return "Please Enter Course Name";
        else if (value.trim().length == 0 || value.trim().length < 3)
          return "Please enter a valid course name";
        else
          return null;
      },
    );
  }
}
