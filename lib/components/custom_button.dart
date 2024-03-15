// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double buttonWidth;
  String buttonName;
  CustomButton(
      {super.key,
      this.buttonWidth = double.infinity,
      required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: buttonWidth,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
