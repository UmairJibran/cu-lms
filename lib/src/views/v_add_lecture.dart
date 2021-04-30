import 'package:flutter/material.dart';

import '../services/lecture_upload.dart';

class AddLecture extends StatefulWidget {
  static final String routeName = "/add-lecture";

  @override
  _AddLectureState createState() => _AddLectureState();
}

class _AddLectureState extends State<AddLecture> {
  /*Variables*/
  late int subjectId;
  late var _key;
  late bool _loading, _error;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late String _supportingFileLink;

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _supportingFileLink = "";
    _loading = false;
    _error = false;
  }

  @override
  Widget build(BuildContext context) {
    subjectId =
        (ModalRoute.of(context)!.settings.arguments as Map)["subjectId"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Lecture"),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: _loading ? Colors.grey : Colors.white),
            onPressed: _loading
                ? null
                : () async {
                    if (_key.currentState.validate()) {
                      setState(() {
                        _loading = true;
                      });
                      Map<String, dynamic> response = await addLecture(
                        lectureDescription: _descriptionController.text,
                        lectureTitle: _titleController.text,
                        subjectId: subjectId,
                        supportingFile: _supportingFileLink,
                      );
                      setState(() {
                        _loading = false;
                      });
                      if (response["uploaded"]) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          _error = true;
                        });
                      }
                    }
                  },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(context),
          width: getWidth(context),
          margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.1),
          child: Form(
            key: _key,
            child: _loading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(height: getHeight(context) * 0.05),
                      Text(
                        "Please Fill these fields with relevant information",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      TextFormField(
                        controller: _titleController,
                        autofocus: true,
                        autocorrect: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        enabled: true,
                        maxLength: 255,
                        validator: (value) {
                          if (value == null)
                            return "Please Enter title";
                          else if (value.trim().length < 5)
                            return "Please Enter a valid title";
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          hintText: "String Manipulation",
                          labelText: "Lecture Title",
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        autocorrect: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        enabled: true,
                        maxLength: 2550,
                        minLines: 1,
                        maxLines: 50,
                        decoration: InputDecoration(
                          hintText:
                              "This lecture includes different topics on string manipulation",
                          labelText: "Lecture Description",
                        ),
                      ),
                      if (_error)
                        Text(
                          "An Error Occured",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
