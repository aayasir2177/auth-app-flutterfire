// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:auth_app_flutterfire/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/SignInView');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.grey[300],
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(FirebaseAuth.instance.currentUser!.email.toString()),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: signUserOut,
                child: CustomButton(
                  buttonName: "Logout",
                  buttonWidth: MediaQuery.of(context).size.width / 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
