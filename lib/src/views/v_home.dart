import 'package:flutter/material.dart';

import 'v_login.dart';

class Home extends StatelessWidget {
  static final routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CU-LMS"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text("Login"),
          onPressed: () => Navigator.of(context).pushNamed(
            Login.routeName,
          ),
        ),
      ),
    );
  }
}
