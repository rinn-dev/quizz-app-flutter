import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(softScreenBackground),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/app_splash_logo.png",
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Center(
              child: Text(
                "Code Quizzes",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                  height: 1.5,
                  color: const Color(secondaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
