import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/question_paper/question_controller.dart';
import 'package:quizz_app/firebase/loading_status.dart';

class QuestionsNavigation extends GetView<QuestionController> {
  const QuestionsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            if (controller.loadingStatus.value == LoadingStatus.completed) ...[
              Ink(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Visibility(
                  visible: !controller.isFirstQuestion,
                  child: InkWell(
                    onTap: controller.backToPrevious,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.chevron_left),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: controller.skipToNext,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.isLastQuestion
                          ? const Center(
                              child: Text(
                                "Check Results",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(secondaryColor),
                                  height: 1.75,
                                ),
                              ),
                            )
                          : const Icon(Icons.chevron_right),
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      );
    });
  }
}
