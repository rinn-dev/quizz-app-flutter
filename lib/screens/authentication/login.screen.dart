import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/widgets/long_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(softScreenBackground),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.05, right: Get.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/books.png",
                    width: 320,
                    height: 320,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Please sign in to answer the quizzes.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                  LongButton(
                    onClicked: controller.signInWithGoogle,
                    buttonText: "Sign In with Google",
                    bgColor: secondaryColor,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 5,
              child: BackButton(
                onPressed: controller.navigateToHome,
                color: const Color(highlightColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
