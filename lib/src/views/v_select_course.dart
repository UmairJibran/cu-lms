import 'package:flutter/material.dart';

import '../models/course.dart';

import '../components/course_list_tile.dart';

import '../services/get_courses.dart';

class SelectCourse extends StatefulWidget {
  static final routeName = "/select-course";

  @override
  _SelectCourseState createState() => _SelectCourseState();
}

class _SelectCourseState extends State<SelectCourse> {
  /*Variables*/
  late List<Course> courses;
  late bool _loading;
  late int teacherId;

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  getCourses() async {
    setState(() {
      _loading = true;
    });
    var temp = await fetchCourses();
    temp.forEach((course) {
      var map = Map<String, dynamic>.from(course);
      var user = Course.fromJson(map);
      courses.add(user);
    });
    setState(() {
      _loading = false;
    });
  }

  initState() {
    super.initState();
    _loading = false;
    courses = [];
    getCourses();
  }

  @override
  Widget build(BuildContext context) {
    teacherId =
        (ModalRoute.of(context)!.settings.arguments as Map)["teacherId"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Course"),
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
                    "Select a Course",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: getHeight(context) * 0.02),
                    height: getHeight(context) * 0.77,
                    width: getWidth(context),
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        Course course = courses[index];
                        return CourseListTile(
                          course: course,
                          teacherId: teacherId,
                        );
                      },
                      itemCount: courses.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
