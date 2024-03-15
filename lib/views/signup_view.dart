// ignore_for_file: prefer_const_constructors

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:auth_app_flutterfire/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _firtNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

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
                "Hello There!",
                style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(fontSize: 44)),
              ),

              const Text("Signup now and become a part of our family!"),
              const SizedBox(
                height: 50,
              ),

              // Login
              CustomTextField(
                textController: _firtNameController,
                hintText: "First name",
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textController: _lastNameController,
                hintText: "Last name",
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textController: _ageController,
                hintText: "Age",
                keyboardType: TextInputType.number,
              ),

              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                textController: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 10,
              ),

              CustomTextField(
                  textController: _passController,
                  hintText: "Password",
                  obscureText: true),

              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  textController: _confirmPassController,
                  hintText: "Confirm Password",
                  obscureText: true),

              const SizedBox(
                height: 10,
              ),

              CustomButton(
                buttonName: "Sign Up",
              ),

              const SizedBox(
                height: 15,
              ),

              // Signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignInView');
                    },
                    child: Text(
                      " Sign In",
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
