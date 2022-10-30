import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/ui/menu_drawer_controller.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomePageMenuScreen extends GetView<MenuDrawerController> {
  const HomePageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color(secondaryColor).withOpacity(0.3)),
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 10,
                child: ClickableIcon(
                  icon: Icons.close_fullscreen,
                  onClick: controller.toggleDrawer,
                  iconSize: 21,
                  iconColor: highlightColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
