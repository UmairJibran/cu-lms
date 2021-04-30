import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart' as fp;

import '../services/assignment_submission.dart';

class AssignmentSubmission extends StatefulWidget {
  static final routeName = "/assignment-submission";

  @override
  _AssignmentSubmissionState createState() => _AssignmentSubmissionState();
}

class _AssignmentSubmissionState extends State<AssignmentSubmission> {
  /* Variables*/
  late var assignment; //TODO: Finalise this
  late bool _loading, _filePresent, _error;
  late String? assignmentFile;
  late var err;

  /* Functions*/

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  initState() {
    super.initState();
    _loading = false;
    _filePresent = false;
    _error = false;
  }

  @override
  Widget build(BuildContext context) {
    assignment =
        (ModalRoute.of(context)!.settings.arguments as Map)["assignment"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment Submission"),
        actions: [
          _filePresent
              ? IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    setState(() {
                      _loading = true;
                    });
                    var res = await assignmentSubmission(
                        assignment["assignment_id"], assignmentFile!);
                    if (res["error"])
                      setState(() {
                        _error = true;
                        err = res["msg"]["sqlMessage"];
                      });
                    setState(() {
                      _loading = false;
                    });
                    Navigator.of(context).pop();
                  },
                )
              : SizedBox(),
        ],
      ),
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          children: [
            if (_loading) LinearProgressIndicator(),
            Container(
              height: getHeight(context) * 0.877,
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(context) * 0.1,
                vertical: getHeight(context) * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Assignment#${assignment["assignment_id"]}",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          assignment["assignment_title"],
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          assignment["assignment_description"],
                        ),
                        if (_error)
                          Text(
                            err.toString(),
                            style: TextStyle(
                              color: Colors.red[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: pickFile,
                    child: Text("Choose File"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    fp.FilePickerResult? result = await fp.FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: fp.FileType.custom,
      allowedExtensions: ["pdf", "doc", "docx", "ppt", "zip", "rar"],
    );
    if (result != null) {
      setState(() {
        assignmentFile = result.files.single.path;
        _filePresent = true;
      });
    }
  }
}
