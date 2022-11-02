import 'package:get/get.dart';
import 'package:quizz_app/firebase/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImagePath(String? imageName) async {
    if (imageName == null) {
      return null;
    }
    try {
      var imageRef = firebaseStorage
          .child("category_icon")
          .child("${imageName.toLowerCase()}.png");
      var imagePath = await imageRef.getDownloadURL();
      return imagePath;
    } catch (e) {
      return null;
    }
  }
}
