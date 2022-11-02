import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/question_paper/question_controller.dart';
import 'package:quizz_app/firebase/loading_status.dart';
import 'package:quizz_app/models/Quizz.model.dart';
import 'package:quizz_app/widgets/answers_ink.dart';
import 'package:quizz_app/widgets/questions_naviation.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: const Color(softScreenBackground),
        body: Stack(children: [
          if (controller.loadingStatus.value == LoadingStatus.loading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(highlightColor),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05,
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: Text(
                                  controller.currentQuestion.value!.question,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(secondaryColor),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GetBuilder<QuestionController>(
                                id: 'answers_section',
                                builder: (controller) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      Answers currentAnswer = controller
                                          .currentQuestion
                                          .value!
                                          .answers[index];
                                      return AnswerInk(
                                        isClicked: controller.currentQuestion
                                                .value!.selectedAnswer ==
                                            currentAnswer.identifier,
                                        onClicked: () {
                                          controller.setAnswer(
                                              currentAnswer.identifier);
                                        },
                                        answer:
                                            "${currentAnswer.identifier}. ${currentAnswer.answer}",
                                      );
                                    }),
                                    separatorBuilder: ((context, index) =>
                                        const SizedBox(
                                          height: 12,
                                        )),
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const QuestionsNavigation(),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ]),
      );
    });
  }
}
