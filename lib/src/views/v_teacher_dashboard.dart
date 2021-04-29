import 'package:flutter/material.dart';

import '../models/subject.dart';

import '../services/fetch_my_sbjects.dart';

import '../components/teacher_dashboard_list_tile.dart';

class TeacherDashboard extends StatefulWidget {
  static final String routeName = "/teacher-dashboard";

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  /*Variables*/
  late bool _loading;
  late List<Subject> subjects;

  /*Functions*/
  getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  void populateSubjects() async {
    var res = await fetchMySubjects();
    setState(() {
      _loading = false;
    });
    res["result"].forEach((subject) {
      subjects.add(Subject.fromJson(subject));
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    populateSubjects();
    subjects = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Dashboard"),
      ),
      body: _loading
          ? CircularProgressIndicator()
          : Container(
              height: getHeight(context),
              width: getWidth(context),
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (_, index) {
                  return TeacherDashboardListTile(subject: subjects[index]);
                },
              ),
            ),
    );
  }
}
