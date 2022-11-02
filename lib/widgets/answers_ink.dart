import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';

class AnswerInk extends StatelessWidget {
  final bool isClicked;
  final VoidCallback onClicked;
  final String answer;

  const AnswerInk({
    super.key,
    required this.isClicked,
    required this.onClicked,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onClicked,
      child: Ink(
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        decoration: BoxDecoration(
          color: isClicked
              ? const Color(highlightColor).withOpacity(0.8)
              : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          answer,
          style: TextStyle(
            color: isClicked ? Colors.white : const Color(secondaryColor),
            fontSize: 14,
            fontWeight: isClicked ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
