import 'package:flutter/material.dart';

import 'v_create_user.dart';
import 'v_create_course.dart';
import 'v_assign_course.dart';
import 'v_login.dart';

import '../components/home_text_button.dart';

class Home extends StatelessWidget {
  static final routeName = "/home";

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CU-LMS"),
        centerTitle: true,
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
        child: Column(
          children: [
            HomeTextButton(
              width: getWidth(context),
              height: getHeight(context),
              label: "Create User",
              onPressed: () {
                Navigator.of(context).pushNamed(CreateUser.routeName);
              },
            ),
            HomeTextButton(
              width: getWidth(context),
              height: getHeight(context),
              label: "Create Course",
              onPressed: () {
                Navigator.of(context).pushNamed(CreateCourse.routeName);
              },
            ),
            HomeTextButton(
              width: getWidth(context),
              height: getHeight(context),
              label: "Assign Course",
              onPressed: () {
                Navigator.of(context).pushNamed(AssignCourse.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
