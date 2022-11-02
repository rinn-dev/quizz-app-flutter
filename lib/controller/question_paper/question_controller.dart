import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizz_app/firebase/loading_status.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/models/Quizz.model.dart';

class QuestionController extends GetxController {
  late Quizz quizz;
  final loadingStatus = LoadingStatus.loading.obs;
  final allQuestions = <Questions>[];
  final currentQuestion = Rxn<Questions>();

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
}
