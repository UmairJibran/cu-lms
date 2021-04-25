import 'package:flutter/material.dart';

import 'src/views/v_home.dart';
import 'src/views/v_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (ctx) => Home(),
        Login.routeName: (ctx) => Login(),
      },
    );
  }
}
