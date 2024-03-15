// ignore_for_file: prefer_const_constructors

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:auth_app_flutterfire/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email and we will send you a password reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textController: _emailController, hintText: "Email"),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                buttonName: "Reset",
                buttonWidth: MediaQuery.of(context).size.width / 3,
              )
            ],
          )),
    );
  }
}
