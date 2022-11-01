import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomeTitleSection extends StatelessWidget {
  final VoidCallback toggleDrawer;
  const HomeTitleSection({super.key, required this.toggleDrawer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClickableIcon(
            onClick: toggleDrawer,
            icon: Icons.menu_open,
            iconSize: 28,
            iconColor: highlightColor,
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
            height: 8,
          ),
          const Text(
            "Check Your Programming Language Expertise Today!",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Color(secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
