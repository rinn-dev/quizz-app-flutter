import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/question_paper/seeding.dart';

class SeedingScreen extends StatelessWidget {
  SeedingScreen({super.key});
  final Seeding seeder = Get.put(Seeding());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Uploading Data"),
      ),
    );
  }
}
