import 'package:flutter/material.dart';
import 'package:quizz_app/constants/colors.dart';

class WarningDialogAlert {
  static final WarningDialogAlert singleton = WarningDialogAlert._internal();
  WarningDialogAlert._internal();

  factory WarningDialogAlert() {
    return singleton;
  }

  static Widget showWarningAlert({required VoidCallback onContinue}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "Unauthorized User",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Please Log in to Continue!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(blackColor),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onContinue,
          child: const Text("Log in"),
        ),
      ],
    );
  }
}
