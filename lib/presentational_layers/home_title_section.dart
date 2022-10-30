import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomeTitleSection extends StatelessWidget {
  const HomeTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClickableIcon(
            onClick: () => 1,
            icon: Icons.menu_open,
            iconSize: 28,
            iconColor: secondaryColor,
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Hi David!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Check Your Programming Language Expertise Today!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
