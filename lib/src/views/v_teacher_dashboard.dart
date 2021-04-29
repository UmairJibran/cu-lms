import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  static final String routeName = "/teacher-dashboard";

  /*Functions*/
  getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Dashboard"),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Center(
          child: Text("Teacher Dashboard"),
        ),
      ),
    );
  }
}
