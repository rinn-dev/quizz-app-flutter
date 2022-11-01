import 'package:get/get.dart';
import 'package:quizz_app/controller/auth/auth.dart';
import 'package:quizz_app/controller/question_paper/quizz_controller.dart';
import 'package:quizz_app/controller/ui/menu_drawer_controller.dart';
import 'package:quizz_app/screens/authentication/login.dart';
import 'package:quizz_app/screens/home/home.dart';
import 'package:quizz_app/screens/introduction/introduction.dart';
import 'package:quizz_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() {
    return [
      GetPage(name: "/", page: () => const SplashScreen()),
      GetPage(name: "/welcome", page: () => const AppWelcomeScreen()),
      GetPage(
        name: "/home",
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          {
            Get.put(QuizzController());
            Get.put(MenuDrawerController());
            Get.put(AuthController());
          }
        }),
      ),
      GetPage(name: "/login", page: () => const LoginScreen()),
    ];
  }
}
