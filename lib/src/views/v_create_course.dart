import 'package:flutter/material.dart';

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
  /*Functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _adding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Course"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (_key.currentState.validate()) {
                setState(() {
                  _adding = true;
                });
                //TODO: Add this course to database
                Navigator.of(context).pop();
                setState(() {
                  _adding = false;
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
                      TextFormField(
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
                          else if (value.trim().length == 0 ||
                              value.trim().length < 3)
                            return "Please enter a valid course name";
                          else
                            return null;
                        },
                      ),
                      TextFormField(
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
                          else if (value.trim().length == 0 ||
                              value.trim().length < 3)
                            return "Please Enter a valid course Prefix with minimum length of 3 characters";
                          else
                            return null;
                        },
                      ),
                      TextFormField(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
