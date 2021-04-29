import 'package:flutter/material.dart';

import '../models/subject.dart';

class TeacherDashboardListTile extends StatelessWidget {
  const TeacherDashboardListTile({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print(subject.id);
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subject.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "(${subject.prefix}-${subject.code})",
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
