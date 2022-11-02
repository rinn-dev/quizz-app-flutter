import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/presentational_layers/introduction_section.dart';

class AppWelcomeScreen extends StatelessWidget {
  const AppWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(softScreenBackground),
      body: Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: const IntroductionSection(),
      ),
    );
  }
}
