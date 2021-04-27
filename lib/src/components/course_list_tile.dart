import 'package:flutter/material.dart';
import '../models/course.dart';

import '../views/v_select_credits.dart';

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
        Navigator.of(context).pushNamed(
          SelectCredits.routeName,
          arguments: {"teacherId": teacherId, "courseId": course.id},
        );
      },
    );
  }
}
