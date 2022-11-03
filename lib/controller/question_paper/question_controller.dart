import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/controller/question_paper/quizz_controller.dart';
import 'package:quizz_app/firebase/loading_status.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/models/Quizz.model.dart';

class QuestionController extends GetxController {
  late Quizz quizz;
  final loadingStatus = LoadingStatus.loading.obs;
  final allQuestions = <Questions>[];
  final currentQuestion = Rxn<Questions>();
  final currentIndex = 0.obs;

  bool get isFirstQuestion => currentIndex.value == 0;
  bool get isLastQuestion => currentIndex.value == allQuestions.length - 1;

  @override
  void onReady() {
    quizz = Get.arguments as Quizz;
    loadQuestions();
    super.onReady();
  }

  void loadQuestions() async {
    loadingStatus.value = LoadingStatus.loading;
    try {
      QuerySnapshot<Map<String, dynamic>> questionsSnapshot =
          await quizzesRF.doc(quizz.id).collection("questions").get();
      List<Questions> questions = questionsSnapshot.docs
          .map((data) => Questions.fromSnapshot(data))
          .toList();
      quizz.questions = questions;
      for (Questions question in quizz.questions!) {
        QuerySnapshot<Map<String, dynamic>> answersSnapshot = await quizzesRF
            .doc(quizz.id)
            .collection("questions")
            .doc(question.id)
            .collection("answers")
            .get();
        List<Answers> answers =
            answersSnapshot.docs.map((a) => Answers.fromSnapshot(a)).toList();
        question.answers = answers;
      }
      if (quizz.questions != null && quizz.questions!.isNotEmpty) {
        allQuestions.assignAll(quizz.questions!);
        currentQuestion.value = allQuestions[0];
        loadingStatus.value = LoadingStatus.completed;
      } else {
        loadingStatus.value = LoadingStatus.error;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void setAnswer(String? answer) {
    currentQuestion.value?.selectedAnswer = answer;
    update(['answers_section']);
  }

  void skipToNext() {
    if (currentIndex.value < allQuestions.length - 1) {
      currentQuestion.value = allQuestions[++currentIndex.value];
    }
  }

  void backToPrevious() {
    if (currentIndex.value > 0) {
      currentQuestion.value = allQuestions[--currentIndex.value];
    }
  }

  void checkResult() {
    Get.offAndToNamed("/results");
  }

  int countCorrectAnswers() {
    final totalCorrectAnswers = allQuestions
        .where((element) => element.selectedAnswer == element.correctAnswer)
        .length;
    return totalCorrectAnswers;
  }

  void saveRecords() async {
    final batch = firestore.batch();
    AuthController authController = Get.find<AuthController>();
    if (!authController.isLoggedIn()) {
      return;
    }
    batch.set(
        userRF
            .doc(authController.user.value?.email)
            .collection("results")
            .doc(quizz.title),
        {
          "points": countCorrectAnswers(),
        });

    await batch.commit();
  }

  void tryagain() {
    Get.find<QuizzController>()
        .checkAuthBeforeQuizzDetails(quizz: quizz, newAttempt: true);
  }
}
