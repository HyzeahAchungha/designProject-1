// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_store/pages/authPages/loginOrRegister.dart';
import 'package:lite_store/pages/index.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Is user loged in?
          if (snapshot.hasData) {
            return Index();
          }
          // Is user Not logged in
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
