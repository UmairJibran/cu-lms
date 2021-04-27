import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseListTile extends StatelessWidget {
  final Course course;
  final int teacherId;

  const CourseListTile(
      {Key? key, required this.course, required this.teacherId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${course.name} ( ${course.prefix}-${course.code} )",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: () {
        print(
            "courseId: ${course.id.runtimeType}\nteacherId: ${teacherId.runtimeType}");
      },
    );
  }
}
