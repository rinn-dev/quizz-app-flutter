import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: const Color(secondaryColor),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
