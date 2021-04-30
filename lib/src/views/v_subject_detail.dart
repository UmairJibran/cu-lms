import 'package:flutter/material.dart';

import '../components/subject_list_tile.dart';
import 'v_add_assignment.dart';
import 'v_add_lecture.dart';
import 'v_assignments_for_subject.dart';

import '../models/subject.dart';

import '../services/fetch_assignments_for_subject.dart';

class SubjectDetails extends StatefulWidget {
  static final String routeName = "/subject-details";
  @override
  _SubjectDetailsState createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  /*Variables*/
  late Subject subject;
  late double height;
  late double width;
  late bool _loading;

  /*functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    subject = (ModalRoute.of(context)!.settings.arguments as Map)["subject"];
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SubjectListTile(
              width: width,
              title: "Add Assignment",
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddAssignment.routeName,
                  arguments: {"subjectId": subject.id},
                );
              },
            ),
            SubjectListTile(
              width: width,
              title: "Add Lecture",
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AddLecture.routeName,
                  arguments: {"subjectId": subject.id},
                );
              },
            ),
            SubjectListTile(
              width: width,
              title: "All Assignments",
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                var assignments = await fetchAssignmentsForSubject(subject.id);
                setState(() {
                  _loading = false;
                });
                Navigator.of(context).pushNamed(
                  AssignmentsForSubject.routeName,
                  arguments: {
                    "assignments": assignments,
                    "subjectName": subject.name,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
