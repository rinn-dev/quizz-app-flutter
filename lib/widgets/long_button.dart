import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClicked;
  final int bgColor;
  const LongButton(
      {super.key,
      required this.buttonText,
      required this.onClicked,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(bgColor),
          padding: const EdgeInsets.all(18.0),
          textStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Sora'),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
