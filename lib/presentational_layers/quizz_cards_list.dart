import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/question_paper/quizz_controller.dart';
import 'package:quizz_app/widgets/quizz_card.dart';

class QuizzCardsList extends GetView<QuizzController> {
  const QuizzCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    QuizzController quizzController = Get.find();
    return Obx(
      () => Expanded(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(softScreenBackground),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 16.0,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.checkAuthBeforeQuizzDetails(
                      quizz: quizzController.quizzes[index],
                    );
                  },
                  child: QuizzCard(quizz: quizzController.quizzes[index]),
                );
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(height: 18);
              }),
              itemCount: quizzController.quizzes.length,
            ),
          ),
        ),
      ),
    );
  }
}
