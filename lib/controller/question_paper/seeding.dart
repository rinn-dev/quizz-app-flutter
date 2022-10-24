import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/models/Quizz.model.dart';

class Seeding extends GetxController {
  @override
  void onReady() {
    seedData();
    super.onReady();
  }

  Future<void> seedData() async {
    final firestore = FirebaseFirestore.instance;
    final assetManifest = json.decode(await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json"));
    final List<String> questionsManifest = assetManifest.keys
        .where((path) =>
            path.startsWith("assets/DB/papers/") && path.contains(".json"))
        .toList();
    List<Quizz> quizzModels = [];
    for (String path in questionsManifest) {
      var questionPaper = await rootBundle.loadString(path);
      quizzModels.add(Quizz.fromJson(json.decode(questionPaper)));
    }

    final batch = firestore.batch();
    for (Quizz quizz in quizzModels) {
      batch.set(quizzesRF.doc(quizz.id), {
        "title": quizz.title,
        "image_url": quizz.imageUrl,
        "description": quizz.description,
        "timeSeconds": quizz.timeSeconds,
        "questions_count":
            quizz.questions == null ? 0 : quizz.questions?.length,
      });

      for (Questions question in quizz.questions!) {
        DocumentReference questionId = questionRF(quizz.id, question.id);
        batch.set(questionId, {
          "question": question.question,
          "correct_answer": question.correctAnswer,
        });

        for (Answers answer in question.answers) {
          DocumentReference answerId = answerRF(questionId, answer.identifier);
          batch.set(answerId, {
            "identifier": answer.identifier,
            "answer": answer.answer,
          });
        }
      }
    }

    await batch.commit();
  }
}
