import 'package:flutter/material.dart';
import '../models/user.dart';
import '../views/v_select_course.dart';

class TeacherListTile extends StatelessWidget {
  final User teacher;

  const TeacherListTile({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${teacher.name} ( ${teacher.id} )",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(SelectCourse.routeName);
      },
    );
  }
}
