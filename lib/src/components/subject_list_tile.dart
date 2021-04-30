import 'package:flutter/material.dart';

class SubjectListTile extends StatelessWidget {
  const SubjectListTile({
    Key? key,
    required this.width,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
