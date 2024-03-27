// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, use_build_context_synchronously

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:auth_app_flutterfire/components/custom_text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator.adaptive());
        });

    try {
      if (_passController.text == _confirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text,
        );

        toastification.show(
          context: context,
          title: Text('Account has been successfully created.'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 5),
        );

        Navigator.pushReplacementNamed(context, '/');
      } else {
        toastification.show(
          context: context,
          title: Text('Password and confirm password does not match!'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastification.show(
          context: context,
          title: Text('The password provided is too weak.'),
          type: ToastificationType.warning,
          autoCloseDuration: const Duration(seconds: 5),
        );

        _passController.clear();
        _confirmPassController.clear();
      } else if (e.code == 'email-already-in-use') {
        toastification.show(
          context: context,
          title: Text('The account already exists for that email.'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      print(e);
    }

    Navigator.pop(context);
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

              GestureDetector(
                onTap: signUserUp,
                child: CustomButton(
                  buttonName: "Sign Up",
                ),
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
                      Navigator.pushReplacementNamed(context, '/SignInView');
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
