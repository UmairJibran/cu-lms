import 'package:flutter/material.dart';

import '../components/subject_list_tile.dart';
import '../views/v_add_assignment.dart';

import '../models/subject.dart';

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

  /*functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
