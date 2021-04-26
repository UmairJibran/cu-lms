import 'package:flutter/material.dart';

import '../components/course_code_text_field.dart';
import '../components/course_name_text_field.dart';
import '../components/course_prefix_text_field.dart';

import '../services/create_course.dart';

class CreateCourse extends StatefulWidget {
  static final routeName = "/create-course";

  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  /*Variables*/
  late bool _adding;
  late final _key;
  TextEditingController _courseNameController = TextEditingController();
  TextEditingController _courseCodeController = TextEditingController();
  TextEditingController _coursePrefixController = TextEditingController();
  late bool _error;

  /*Functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _adding = false;
    _error = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Course"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              if (_key.currentState.validate()) {
                setState(() {
                  _adding = true;
                });
                var response = await createCourse(
                  _courseNameController.text,
                  _coursePrefixController.text.toUpperCase(),
                  _courseCodeController.text,
                );
                setState(() {
                  _adding = false;
                });
                if (response == "true")
                  Navigator.of(context).pop();
                else
                  setState(() {
                    _error = true;
                  });
              }
            },
          ),
        ],
      ),
      body: _adding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: getHeight(context),
              width: getWidth(context),
              margin: EdgeInsets.symmetric(
                vertical: getHeight(context) * 0.05,
                horizontal: getWidth(context) * 0.1,
              ),
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CourseNameTextField(
                          courseNameController: _courseNameController),
                      CoursePrefixTextField(
                          coursePrefixController: _coursePrefixController),
                      CourseCodeTextField(
                          courseCodeController: _courseCodeController),
                      if (_error)
                        Text(
                          "An Error has Occured. Please try again",
                          style: TextStyle(
                            color: Colors.red[800],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
