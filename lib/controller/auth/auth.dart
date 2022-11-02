import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizz_app/firebase/references.dart';
import 'package:quizz_app/widgets/dialog_alert.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;
  late Stream<User?> authStateChanges;
  final user = Rxn<User?>();

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();
    authStateChanges.listen((User? currentUser) {
      user.value = currentUser;
    });

    await Future.delayed(const Duration(seconds: 3));
    navigateToWelcome();
  }

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleAccount.authentication;
        AuthCredential authCredentials = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await auth.signInWithCredential(authCredentials);
        signUpUser(googleAccount);
        navigateToHome();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  signOut() {
    auth.signOut();
    navigateToHome();
  }

  signUpUser(GoogleSignInAccount account) async {
    await userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "avatar": account.photoUrl,
    });
  }

  void navigateToWelcome() {
    Get.offAllNamed("/welcome");
  }

  void navigateToHome() {
    Get.offAllNamed("/home");
  }

  void navigateToLogin() {
    Get.offAllNamed("/login");
  }

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  void showDialog() {
    Get.dialog(
      WarningDialogAlert.showWarningAlert(
        onContinue: () {
          Get.back();
          navigateToLogin();
        },
      ),
      barrierDismissible: false,
    );
  }
}
