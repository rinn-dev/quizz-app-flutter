import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
final quizzesRF = firestore.collection("quizzes");

DocumentReference questionRF(String quizzId, String questionId) {
  return quizzesRF.doc(quizzId).collection("questions").doc(questionId);
}

DocumentReference answerRF(DocumentReference questionId, String answerId) {
  return questionId.collection("answers").doc(answerId);
}

Reference get firebaseStorage => FirebaseStorage.instance.ref();
