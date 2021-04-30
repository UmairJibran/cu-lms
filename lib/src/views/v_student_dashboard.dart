import 'package:flutter/material.dart';

import 'v_login.dart';
import 'v_assignment_submission.dart';

import '../services/display_all_assignments.dart';

class StudentDashboard extends StatefulWidget {
  static final routeName = "/student-dashboard";

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  /* Variables*/
  late var assignments;
  late bool _loading;

  /* Functions*/
  getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _loading = false;
    assignments = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
        ],
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                var response = await displayAllAssignments();
                setState(() {
                  assignments = response["results"];
                });
              },
              child: Text("Load My Assignments"),
            ),
            Container(
              width: getWidth(context),
              height: getHeight(context) * 0.812,
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AssignmentSubmission.routeName,
                              arguments: {"assignment": assignments[index]},
                            );
                          },
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
          ],
        ),
      ),
    );
  }
}
