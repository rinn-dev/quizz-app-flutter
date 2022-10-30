import 'package:flutter/material.dart';
import 'package:quizz_app/presentational_layers/home_title_section.dart';
import 'package:quizz_app/presentational_layers/quizz_cards_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Column(
            children: const [
              HomeTitleSection(),
              SizedBox(
                height: 16,
              ),
              QuizzCardsList(),
            ],
          ),
        ),
      ),
    );
  }
}
