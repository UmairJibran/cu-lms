import 'package:flutter/material.dart';

import 'v_home.dart';
import 'v_student_dashboard.dart';

import '../models/user.dart';

import '../components/password_text_field.dart';
import '../components/username_text_field.dart';

import '../services/global_config.dart';
import '../services/authenticate.dart';

class Login extends StatefulWidget {
  static final routeName = "/";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /*Variables*/
  late final _key;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late bool _loading, _invalidCredentials;

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _loading = false;
    _invalidCredentials = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(context) * 0.1,
          vertical: getHeight(context) * 0.1,
        ),
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/assets/logo.png",
                        height: getHeight(context) * 0.3,
                        fit: BoxFit.cover,
                      ),
                      UsernameTextField(
                          usernameController: _usernameController),
                      PasswordTextField(
                          passwordController: _passwordController),
                      Row(
                        mainAxisAlignment: _invalidCredentials
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.end,
                        children: [
                          if (_invalidCredentials)
                            Text(
                              "Invalid Username &\npassword combination",
                              style: TextStyle(
                                color: Colors.red[800],
                              ),
                            ),
                          TextButton(
                            child: Text("Login"),
                            onPressed: () async {
                              if (_key.currentState.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                _key.currentState.save();
                                dynamic response = await authenticateLogin(
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                                if (response["authenticated"]) {
                                  loggedInUser = User.fromJson(response);
                                  if (loggedInUser.role == "student")
                                    Navigator.of(context).pushReplacementNamed(
                                        StudentDashboard.routeName);
                                  else if (loggedInUser.role == "admin")
                                    Navigator.of(context)
                                        .pushReplacementNamed(Home.routeName);
                                } else {
                                  setState(() {
                                    _invalidCredentials = true;
                                    _loading = false;
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
