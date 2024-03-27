// ignore_for_file: prefer_const_constructors, unused_import

import 'package:auth_app_flutterfire/firebase_auth/user_checker.dart';
import 'package:auth_app_flutterfire/views/home_view.dart';
import 'package:auth_app_flutterfire/views/reset_password_view.dart';
import 'package:auth_app_flutterfire/views/signin_view.dart';
import 'package:auth_app_flutterfire/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App FlutterFire',
      routes: {
        '/': (context) => UserChecker(),
        '/SignInView': (context) => SignInView(),
        '/SignUpView': (context) => SignUpView(),
        '/ResetPasswordView': (context) => ResetPasswordView(),
      },
    );
  }
}
