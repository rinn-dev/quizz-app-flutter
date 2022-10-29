import 'package:flutter/material.dart';
import 'package:quizz_app/models/Quizz.model.dart';
import 'package:quizz_app/widgets/quizz_card_contents.dart';
import 'package:quizz_app/widgets/quizz_icon.dart';

class QuizzCard extends StatelessWidget {
  final Quizz quizz;
  const QuizzCard({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ColoredBox(
        color: Colors.white,
        child: SizedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 12.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuizzIcon(iconUrl: quizz.imageUrl),
                const SizedBox(
                  width: 16,
                ),
                QuizzCardContents(
                  quizz: quizz,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
