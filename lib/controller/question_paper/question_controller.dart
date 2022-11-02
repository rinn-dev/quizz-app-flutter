import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/models/Quizz.model.dart';

class QuestionController extends GetxController {
  late Quizz quizz;

  @override
  void onReady() {
    quizz = Get.arguments as Quizz;
    loadQuestions();
    super.onReady();
  }

  void loadQuestions() async {
    QuerySnapshot<Map<String, dynamic>> questionsSnapshot =
        await quizzesRF.doc(quizz.id).collection("questions").get();
    List<Questions> questions = questionsSnapshot.docs
        .map((data) => Questions.fromSnapshot(data))
        .toList();
    quizz.questions = questions;
    for (Questions question in questions) {
      QuerySnapshot<Map<String, dynamic>> answersSnapshot = await quizzesRF
          .doc(quizz.id)
          .collection("questions")
          .doc(question.id)
          .collection("answers")
          .get();
      List<Answers> answers =
          answersSnapshot.docs.map((a) => Answers.fromSnapshot(a)).toList();
      question.answers = answers;
      print(answers);
    }
  }
}
