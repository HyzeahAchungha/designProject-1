// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_store/pages/authPages/formUtils/inputs.dart';
import 'package:lite_store/pages/authPages/formUtils/otherSign.dart';
import 'package:lite_store/pages/authPages/formUtils/passfield.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Color gray = Color.fromARGB(255, 128, 127, 127);
  final Color blue = Color.fromRGBO(91, 118, 255, 0.91);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void signInUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      // pop the login circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the login circle
      Navigator.pop(context);
      wrongPassword(e.code);
    }
  }

  // wrong Password message popup
  void wrongPassword(e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 227, 227),
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
                  child: Icon(
                    Icons.lock,
                    size: 100,
                    color: blue,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Welcome back. You\'ve been missing!',
                    style: TextStyle(
                      color: gray,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Forgot Password?')],
                  ),
                ),
                // Login button...........
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      signInUser();
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
                          "Login",
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 254, 254)),
                        ),
                      ),
                    ),
                  )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        Text('Not a member?'),
                        GestureDetector(
                          onTap: () {
                            widget.onTap!();
                          },
                          child: Text(
                            ' Register',
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
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
