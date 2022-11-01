import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/models/Quizz.model.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';

class QuizzController extends GetxController {
  final quizzes = <Quizz>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    FirebaseStorageService storageServiceController =
        Get.put(FirebaseStorageService());
    try {
      QuerySnapshot<Map<String, dynamic>> dataSnapshot = await quizzesRF.get();
      var quizzModels = dataSnapshot.docs.map((doc) {
        return Quizz.fromSnapshot(doc);
      }).toList();
      for (var quizz in quizzModels) {
        var imagePath =
            await storageServiceController.getImagePath(quizz.title);
        quizz.imageUrl = imagePath!;
      }
      quizzes.assignAll(quizzModels);
    } catch (e) {
      print(e);
    }
  }

  void checkAuthBeforeQuizzDetails({
    required Quizz quizz,
    bool newAttempt = false,
  }) {
    AuthController auth = Get.find();
    if (auth.isLoggedIn()) {
    } else {
      auth.showDialog();
    }
  }
}
