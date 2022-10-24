import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/question_paper/seeding.dart';
import 'package:quizz_app/firebase/loading_status.dart';

class SeedingScreen extends StatelessWidget {
  SeedingScreen({super.key});
  final Seeding seeder = Get.put(Seeding());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            seeder.loadingStatus.value == LoadingStatus.loading
                ? "Uploading"
                : "Completed",
          ),
        ),
      ),
    );
  }
}
