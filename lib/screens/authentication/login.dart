import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/auth/auth.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(
          onPressed: controller.signInWithGoogle,
          child: const Text("Sign In with Google"),
        ),
      ),
    );
  }
}
