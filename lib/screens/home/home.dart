import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controller/question_paper/quizz_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizzController quizzController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    image: NetworkImage(quizzController.quizzImages[index]),
                    placeholder: const AssetImage("assets/images/physics.png"),
                  ),
                ),
              );
            },
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 20);
            }),
            itemCount: quizzController.quizzImages.length),
      ),
    );
  }
}
