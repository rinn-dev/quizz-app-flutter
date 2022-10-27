import 'package:get/get.dart';
import 'package:quizz_app/services/firebase_storage_service.dart';

class QuizzController extends GetxController {
  final quizzImages = <String>[].obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    List<String> imageNames = ['javascript', 'physics'];
    FirebaseStorageService storageServiceController =
        Get.put(FirebaseStorageService());
    try {
      for (var imageName in imageNames) {
        var imagePath = await storageServiceController.getImagePath(imageName);
        quizzImages.add(imagePath!);
      }
    } catch (e) {
      print(e);
    }
  }
}
