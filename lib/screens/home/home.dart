import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/question_paper/quizz_controller.dart';
import 'package:quizz_app/widgets/quizz_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizzController quizzController = Get.find();
    return Scaffold(
      backgroundColor: const Color(softScreenBackground),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return QuizzCard(quizz: quizzController.quizzes[index]);
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(height: 18);
              }),
              itemCount: quizzController.quizzes.length),
        ),
      ),
    );
  }
}
