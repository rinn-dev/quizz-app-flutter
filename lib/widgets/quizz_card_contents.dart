import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';
import 'package:quizz_app/models/Quizz.model.dart';
import 'package:quizz_app/widgets/icon_text.dart';

class QuizzCardContents extends StatelessWidget {
  final Quizz quizz;
  const QuizzCardContents({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quizz.title,
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(highlightColor),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            quizz.description,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.clip,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              IconText(
                text: "${quizz.questionsCount} Quizzes",
                icon: Icons.quiz_rounded,
              ),
              const SizedBox(
                width: 16,
              ),
              IconText(
                text: "${quizz.generateMinutes()} Mins",
                icon: Icons.punch_clock_rounded,
              )
            ],
          ),
        ],
      ),
    );
  }
}
