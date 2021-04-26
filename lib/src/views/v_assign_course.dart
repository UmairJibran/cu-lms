import 'package:flutter/material.dart';

import '../models/user.dart';

import '../components/teacher_list_tile.dart';

import '../services/get_teachers.dart';

class AssignCourse extends StatefulWidget {
  static final routeName = "/assign-course";

  @override
  _AssignCourseState createState() => _AssignCourseState();
}

class _AssignCourseState extends State<AssignCourse> {
  /*Variables*/
  late List<User> teachers;
  late bool _loading;

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  getTeachers() async {
    setState(() {
      _loading = true;
    });
    var temp = await fetchTeachers();
    temp.forEach((teacher) {
      var map = Map<String, dynamic>.from(teacher);
      var user = User.fromJson(map);
      teachers.add(user);
    });
    setState(() {
      _loading = false;
    });
  }

  initState() {
    super.initState();
    _loading = false;
    teachers = [];
    getTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assign Course"),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        margin: EdgeInsets.only(
          top: getHeight(context) * 0.05,
        ),
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    "Select a Teacher",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: getHeight(context) * 0.02),
                    height: getHeight(context) * 0.77,
                    width: getWidth(context),
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        User teacher = teachers[index];
                        return TeacherListTile(teacher: teacher);
                      },
                      itemCount: teachers.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
