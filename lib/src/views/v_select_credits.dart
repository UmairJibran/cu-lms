import 'package:flutter/material.dart';

import '../views/v_home.dart';

import '../services/assign_course_to_teacher.dart';

class SelectCredits extends StatefulWidget {
  static final routeName = "/select-credits";

  @override
  _SelectCreditsState createState() => _SelectCreditsState();
}

class _SelectCreditsState extends State<SelectCredits> {
  /*Variables */
  late int _selectedCredits;
  late bool _registering;
  late int _teacherId;
  late int _courseId;

  /*Functions */
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedCredits = 2;
    _registering = false;
  }

  @override
  Widget build(BuildContext context) {
    _teacherId =
        (ModalRoute.of(context)!.settings.arguments as Map)["teacherId"];
    _courseId = (ModalRoute.of(context)!.settings.arguments as Map)["courseId"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Credit hours"),
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: _registering
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: 7,
                itemBuilder: (_, index) {
                  return index == 6
                      ? TextButton(
                          onPressed: () async {
                            setState(() {
                              _registering = true;
                            });
                            final response = await assignCourseToTeacher(
                                teacherId: _teacherId,
                                courseId: _courseId,
                                subjectCredits: _selectedCredits + 1);
                            setState(() {
                              _registering = false;
                            });
                            if (response["assigned"]) {
                              Navigator.of(context).popUntil(
                                ModalRoute.withName(Home.routeName),
                              );
                            }
                          },
                          child: Text("Register Subject"),
                        )
                      : ListTile(
                          tileColor: _selectedCredits == index
                              ? Colors.green
                              : Colors.white,
                          title: Text(
                            "${index + 1}",
                            style: TextStyle(
                              color: _selectedCredits == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedCredits = index;
                            });
                          },
                        );
                },
              ),
      ),
    );
  }
}
