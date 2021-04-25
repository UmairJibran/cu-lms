import 'package:flutter/material.dart';

class AssignCourse extends StatefulWidget {
  static final routeName = "/assign-course";

  @override
  _AssignCourseState createState() => _AssignCourseState();
}

class _AssignCourseState extends State<AssignCourse> {
  /*Variables*/

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assign Course"),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Center(
          child: Text("Assign Teacher"),
        ),
      ),
    );
  }
}
