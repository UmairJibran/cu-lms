import 'package:flutter/material.dart';

import 'v_home.dart';

import '../components/password_text_field.dart';
import '../components/username_text_field.dart';

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

  /*Functions*/
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
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
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Image.asset(
                  "lib/assets/logo.png",
                  height: getHeight(context) * 0.3,
                  fit: BoxFit.cover,
                ),
                UsernameTextField(usernameController: _usernameController),
                PasswordTextField(passwordController: _passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("Login"),
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          _key.currentState.save();
                          //TODO: authenticate User then navigate to home
                          print(_usernameController.text);
                          print(_passwordController.text);
                          Navigator.of(context)
                              .pushReplacementNamed(Home.routeName);
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
