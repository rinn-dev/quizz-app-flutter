import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/controller/ui/menu_drawer_controller.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomePageMenuScreen extends GetView<MenuDrawerController> {
  const HomePageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Obx(
      () => Container(
        decoration: const BoxDecoration(color: Color(softScreenBackground)),
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
                ),
                if (authController.user.value != null) ...[
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: InkWell(
                      onTap: authController.signOut,
                      child: Row(
                        children: const [
                          Icon(
                            FluentSystemIcons.ic_fluent_sign_out_filled,
                            color: Color(secondaryColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Signout",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(secondaryColor),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
                if (authController.user.value == null) ...[
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: InkWell(
                      onTap: authController.navigateToLogin,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.login,
                            color: Color(secondaryColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(secondaryColor),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
