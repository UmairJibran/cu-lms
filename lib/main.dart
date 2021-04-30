import 'package:flutter/material.dart';

import 'src/views/v_home.dart';
import 'src/views/v_login.dart';
import 'src/views/v_create_user.dart';
import 'src/views/v_create_course.dart';
import 'src/views/v_assign_course.dart';
import 'src/views/v_select_course.dart';
import 'src/views/v_select_credits.dart';
import 'src/views/v_student_dashboard.dart';
import 'src/views/v_teacher_dashboard.dart';
import 'src/views/v_subject_detail.dart';
import 'src/views/v_add_assignment.dart';
import 'src/views/v_add_lecture.dart';
import 'src/views/v_assignments_for_subject.dart';
import 'src/views/v_lectures_for_subject.dart';
import 'src/views/v_assignment_submission.dart';

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
        SelectCredits.routeName: (ctx) => SelectCredits(),
        StudentDashboard.routeName: (ctx) => StudentDashboard(),
        TeacherDashboard.routeName: (ctx) => TeacherDashboard(),
        SubjectDetails.routeName: (ctx) => SubjectDetails(),
        AddAssignment.routeName: (ctx) => AddAssignment(),
        AddLecture.routeName: (ctx) => AddLecture(),
        AssignmentsForSubject.routeName: (ctx) => AssignmentsForSubject(),
        LecturesForSubject.routeName: (ctx) => LecturesForSubject(),
        AssignmentSubmission.routeName: (ctx) => AssignmentSubmission(),
      },
    );
  }
}
