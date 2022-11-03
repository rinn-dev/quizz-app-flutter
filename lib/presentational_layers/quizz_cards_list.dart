import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
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
