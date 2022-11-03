import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/controller/question_paper/question_controller.dart';

class ResultScreen extends GetView<QuestionController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(softScreenBackground),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "You Got ${controller.countCorrectAnswers()} Out of ${controller.allQuestions.length} Questions!",
                  style: const TextStyle(
                    color: Color(highlightColor),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/result_sign.png",
                width: 320,
                height: 320,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: controller.tryagain,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.refresh_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: const Color(highlightColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () =>
                            Get.offNamedUntil('/home', (route) => false),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Back To Home",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                height: 1.75,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
