import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  static final routeName = "/student-dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Student Dashboard"),
        ),
      ),
    );
  }
}
