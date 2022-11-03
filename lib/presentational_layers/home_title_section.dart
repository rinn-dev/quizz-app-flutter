import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomeTitleSection extends GetView<AuthController> {
  final VoidCallback toggleDrawer;
  const HomeTitleSection({super.key, required this.toggleDrawer});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
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
            Text(
              "Hello ${controller.user.value != null ? controller.user.value?.displayName : 'New User'}!",
              style: const TextStyle(
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
                color: Color(highlightColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
