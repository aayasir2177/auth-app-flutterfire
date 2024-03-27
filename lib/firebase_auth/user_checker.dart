import 'package:auth_app_flutterfire/views/home_view.dart';
import 'package:auth_app_flutterfire/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserChecker extends StatelessWidget {
  const UserChecker({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const HomeView();
    } else {
      return const SignUpView();
    }
  }
}
