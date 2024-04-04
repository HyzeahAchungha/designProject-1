// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_catch_clause, unnecessary_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lite_store/pages/authPages/formUtils/inputs.dart';
import 'package:lite_store/pages/authPages/formUtils/otherSign.dart';
import 'package:lite_store/pages/authPages/formUtils/passfield.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Color gray = Color.fromARGB(255, 128, 127, 127);
  final Color blue = Color.fromRGBO(91, 118, 255, 0.91);

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();

  void registerUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    if (passController.text == cPassController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        // pop the login circle
        Navigator.pop(context);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop the login circle
        Navigator.pop(context);
        wrongPassword(e.code);
      }
    } else if (passController.text != cPassController.text) {
      Navigator.pop(context);
      wrongPassword2();
    }
  }

  // wrong Password message popup
  void wrongPassword(String e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e),
          );
        });
  }

  void wrongPassword2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Passwords do not match!'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset('lib/images/logo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Welcome! Let\'s get you signed in',
                    style: TextStyle(
                      color: gray,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextInput(
                  hint: "Enter your email",
                  P: "Email",
                  C: emailController,
                ),
                PassField(
                  P: "Password",
                  hint: "*********",
                  C: passController,
                ),
                PassField(
                  P: "Confirm Password",
                  hint: "*********",
                  C: cPassController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      registerUser();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 29),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: blue,
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 254, 254)),
                        ),
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(thickness: 0.4, color: gray)),
                      Text("Or continue with"),
                      Expanded(
                          child: Divider(
                        thickness: 0.4,
                        color: gray,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OtherSign(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?'),
                    GestureDetector(
                      onTap: () {
                        widget.onTap!();
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
