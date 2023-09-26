import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String image;
  final void Function() onPressed;
  const SocialMediaButton(
      {super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      borderOnForeground: true,
      shadowColor: mainColor,
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: mainColor,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            image,
            scale: 12,
          ),
        ),
      ),
    );
    // );
  }
}
