import 'package:get/get.dart';
import 'package:quizz_app/screens/introduction/introduction.dart';
import 'package:quizz_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() {
    return [
      GetPage(name: "/", page: () => const SplashScreen()),
      GetPage(name: "/welcome", page: () => const AppWelcomeScreen()),
    ];
  }
}
