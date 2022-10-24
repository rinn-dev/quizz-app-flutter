import 'package:get/get.dart';
import 'package:quizz_app/controller/auth/auth.dart';

class BootstrapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
      permanent: true,
    );
  }
}
