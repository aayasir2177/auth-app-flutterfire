// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  var textController = TextEditingController();
  String hintText;
  TextInputType keyboardType;
  bool obscureText;

  CustomTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      this.keyboardType = TextInputType.name,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            keyboardType: keyboardType,
            controller: textController,
            obscureText: obscureText,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
        ));
  }
}
