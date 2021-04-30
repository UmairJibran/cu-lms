import 'package:flutter/material.dart';

import 'v_login.dart';

class StudentDashboard extends StatelessWidget {
  static final routeName = "/student-dashboard";

  /*Functions*/
  getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
        ],
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Center(
          child: Text("Student Dashboard"),
        ),
      ),
    );
  }
}
