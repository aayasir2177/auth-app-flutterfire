// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:auth_app_flutterfire/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator.adaptive());
        });

    if (_passController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passController.text);

        toastification.show(
          context: context,
          title:
              Text('Welcome back ${FirebaseAuth.instance.currentUser!.email}'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 5),
        );

        Navigator.pushReplacementNamed(context, '/');
      } on FirebaseAuthException {
        toastification.show(
          context: context,
          title: Text("Incorrect email or password!"),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );

        Navigator.pop(context);
      }
    } else {
      toastification.show(
        context: context,
        title: Text('Enter field(s)!'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );

      Navigator.pop(context);
    }
  }

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
                obscureText: true,
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
                      Navigator.pushReplacementNamed(
                          context, "/ResetPasswordView");
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

              GestureDetector(
                onTap: signUserIn,
                child: CustomButton(
                  buttonName: "Sign In",
                ),
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
                      Navigator.pushReplacementNamed(context, '/SignUpView');
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
