import 'package:flutter/material.dart';

class HomeTextButton extends StatelessWidget {
  final double height;
  final double width;
  final String label;
  final onPressed;

  const HomeTextButton({
    Key? key,
    required this.height,
    required this.width,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
