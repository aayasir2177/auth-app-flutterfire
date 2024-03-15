// ignore_for_file: prefer_const_constructors

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:auth_app_flutterfire/components/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.android,
                size: 64,
              ),
              const SizedBox(
                height: 50,
              ),

              // Greetings
              Text(
                "Hello Again!",
                style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(fontSize: 44)),
              ),

              const Text("Welcome back, You've been missed!"),
              const SizedBox(
                height: 50,
              ),

              // Login
              CustomTextField(
                textController: _emailController,
                hintText: "Email",
              ),

              const SizedBox(
                height: 10,
              ),

              CustomTextField(
                textController: _passController,
                hintText: "Password",
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/ResetPasswordView");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              CustomButton(
                buttonName: "Sign In",
              ),

              const SizedBox(
                height: 15,
              ),

              // Signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignUpView');
                    },
                    child: Text(
                      " Register now",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
