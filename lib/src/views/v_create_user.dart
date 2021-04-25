import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import '../components/email_text_field.dart';
import '../components/generated_password_text_field.dart';
import '../components/name_text_field.dart';

class CreateUser extends StatefulWidget {
  static final routeName = "/create-user";

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  /*Variables*/
  var _key;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  late final String _password;
  late String _role;
  final uuid = Uuid();
  late bool _adding;

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  void addRecord() {
    if (_key.currentState.validate()) {
      setState(() {
        _adding = true;
      });
      _key.currentState.save();
      //TODO: Write to database
      setState(() {
        _adding = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _password = uuid.v4().substring(0, 13);
    _role = "student";
    _adding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: addRecord,
          ),
        ],
      ),
      body: _adding
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: getHeight(context),
              width: getWidth(context),
              padding: EdgeInsets.symmetric(
                vertical: getHeight(context) * 0.1,
                horizontal: getWidth(context) * 0.15,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      NameTextField(nameController: _nameController),
                      EmailTextField(emailController: _emailController),
                      GeneratedPasswordTextField(password: _password),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "teacher",
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value.toString();
                                  });
                                },
                              ),
                              Text("Teacher")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "student",
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value.toString();
                                  });
                                },
                              ),
                              Text("Student")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "staff",
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value.toString();
                                  });
                                },
                              ),
                              Text("Staff")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
