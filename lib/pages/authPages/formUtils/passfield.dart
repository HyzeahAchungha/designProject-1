// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class PassField extends StatefulWidget {
  final String P;
  final String hint;
  final TextEditingController C;

  const PassField({super.key, required this.P, required this.hint, required this.C});

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: TextField(
          controller: widget.C,
          obscureText:
              passenable, //if passenable == true, show **, else show password character
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: widget.hint,
              labelText: widget.P,
              fillColor: Color.fromARGB(255, 238, 238, 238),
              filled: true,
              hintFadeDuration: Duration(milliseconds: 200),
              suffix: IconButton(
                  onPressed: () {
                    //add Icon button at end of TextField
                    setState(() {
                      //refresh UI
                      if (passenable) {
                        //if passenable == true, make it false
                        passenable = false;
                      } else {
                        passenable =
                            true; //if passenable == false, make it true
                      }
                    });
                  },
                  icon: Icon(passenable == true
                      ? Icons.remove_red_eye
                      : Icons.password))
              //eye icon if passenable = true, else, Icon is ***__),
              ),
        ),
      ),
    );
  }
}
