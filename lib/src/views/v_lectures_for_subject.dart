import 'package:flutter/material.dart';

class LecturesForSubject extends StatelessWidget {
  static final routeName = "/lectures-for-subject";

  /* Variables*/
  late final dynamic lectures;
  late final String subjectName;

  /* Functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    lectures = (ModalRoute.of(context)!.settings.arguments as Map)["lectures"];
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
                lectures[index]["lecture_title"],
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                lectures[index]["lecture_description"],
              ),
            );
          },
          itemCount: lectures.length,
        ),
      ),
    );
  }
}
