// ignore_for_file: prefer_const_constructors, unused_local_variable, use_super_parameters

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
    return Scaffold(
      backgroundColor: pcolor,
      body: Container(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/auth'),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(280),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset('lib/images/liteLogo1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
