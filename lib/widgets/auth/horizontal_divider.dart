import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final String dividerText;
  const HorizontalDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: mainColor,
            thickness: 3,
            indent: MediaQuery.sizeOf(context).width * 0.05,
            endIndent: MediaQuery.sizeOf(context).width / 15,
            height: 20,
          ),
        ),
        Text(
          "Or $dividerText with",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Divider(
            color: mainColor,
            thickness: 3,
            indent: MediaQuery.sizeOf(context).width / 15,
            endIndent: MediaQuery.sizeOf(context).width * 0.05,
            height: 30,
          ),
        ),
      ],
    );
  }
}
