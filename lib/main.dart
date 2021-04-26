import 'package:flutter/material.dart';

import 'src/views/v_home.dart';
import 'src/views/v_login.dart';
import 'src/views/v_create_user.dart';
import 'src/views/v_create_course.dart';
import 'src/views/v_assign_course.dart';
import 'src/views/v_select_course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(16, 96, 165, 1),
        canvasColor: Colors.white,
        fontFamily: "Raleway",
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        Home.routeName: (ctx) => Home(),
        Login.routeName: (ctx) => Login(),
        CreateUser.routeName: (ctx) => CreateUser(),
        CreateCourse.routeName: (ctx) => CreateCourse(),
        AssignCourse.routeName: (ctx) => AssignCourse(),
        SelectCourse.routeName: (ctx) => SelectCourse(),
      },
    );
  }
}
