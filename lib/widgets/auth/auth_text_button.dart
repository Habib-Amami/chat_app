import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final void Function() onPressed;

  const AuthTextButton(
      {super.key,
      required this.buttonText,
      required this.fontSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: mainColor,
        ),
      ),
    );
  }
}
