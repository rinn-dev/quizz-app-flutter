import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/ui/menu_drawer_controller.dart';
import 'package:quizz_app/presentational_layers/home_title_section.dart';
import 'package:quizz_app/presentational_layers/quizz_cards_list.dart';
import 'package:quizz_app/screens/home/menu.sreen.dart';
import 'package:quizz_app/widgets/clickable_icon.dart';

class HomeScreen extends GetView<MenuDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MenuDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            controller: _.drawerController,
            angle: 0,
            borderRadius: 25,
            slideWidth: MediaQuery.of(context).size.width * 0.55,
            style: DrawerStyle.DefaultStyle,
            backgroundColor: Colors.white.withOpacity(0.5),
            menuScreen: const HomePageMenuScreen(),
            mainScreen: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                  child: Column(
                    children: [
                      HomeTitleSection(
                        toggleDrawer: controller.toggleDrawer,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const QuizzCardsList(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
