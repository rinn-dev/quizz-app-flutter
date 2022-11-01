import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/widgets/long_button.dart';
import 'package:quizz_app/constants/colors.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/app_welcome.png",
          width: 320,
          height: 320,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
          child: Text(
            "Test Your Coding Skills!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Theme.of(context).textTheme.headline5?.fontSize,
              height: 1.5,
              color: const Color(secondaryColor),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            "Choose your core programming language and test your knowledge with our tricky multiple choice questions.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: LongButton(
            buttonText: "Get Started",
            onClicked: () => Get.offAllNamed("/home"),
            bgColor: secondaryColor,
          ),
        ),
      ],
    );
  }
}
