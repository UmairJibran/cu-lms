import 'package:flutter/material.dart';

import 'v_home.dart';

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
                Image.asset("lib/assets/logo.png"),
                TextFormField(
                  controller: _usernameController,
                  autovalidateMode: AutovalidateMode.disabled,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "This can be your employee ID/Email",
                    suffixIcon: Icon(Icons.person_outline_rounded),
                  ),
                  validator: (value) {
                    if (value == null)
                      return "Username Cannot be empty";
                    else if (value.trim().isEmpty)
                      return "Space can not be username";
                    else if (value.trim().length < 4)
                      return "Username's length must be at least 4 characters";
                    else
                      return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enabled: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "**********",
                    suffixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                  validator: (value) {
                    if (value == null)
                      return "Password Cannot be empty";
                    else if (value.isEmpty)
                      return "Password Cannot be empty";
                    else if (value.trim().length < 6)
                      return "Password's length must be at least 6 characters";
                    else
                      return null;
                  },
                ),
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
