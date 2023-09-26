import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthFilledButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const AuthFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: FilledButton(
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(5),
          backgroundColor: MaterialStatePropertyAll(mainColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
