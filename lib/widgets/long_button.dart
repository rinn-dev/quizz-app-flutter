import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClicked;
  final int bgColor;
  final int? textColor;
  const LongButton({
    super.key,
    required this.buttonText,
    required this.onClicked,
    required this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(bgColor),
        foregroundColor: textColor != null ? Color(textColor!) : Colors.white,
        padding: const EdgeInsets.all(18.0),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'Sora',
        ),
      ),
      child: Text(buttonText),
    );
  }
}
