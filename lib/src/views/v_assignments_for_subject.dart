import 'package:flutter/material.dart';

class AssignmentsForSubject extends StatelessWidget {
  static final routeName = "/assignments-for-subject";

  /* Variables*/
  late final dynamic assignments;
  late final String subjectName;

  /* Functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    assignments =
        (ModalRoute.of(context)!.settings.arguments as Map)["assignments"];
    subjectName =
        (ModalRoute.of(context)!.settings.arguments as Map)["subjectName"];
    return Scaffold(
      appBar: AppBar(title: Text(subjectName)),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: ListView.builder(
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                assignments[index]["assignment_title"],
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                assignments[index]["assignment_description"],
              ),
            );
          },
          itemCount: assignments.length,
        ),
      ),
    );
  }
}
