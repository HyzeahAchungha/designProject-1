// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String P;
  final String hint;
  final TextEditingController C;

  const TextInput({super.key, required this.P, required this.hint, required this.C});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: TextField(
          controller: C,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: P,
            hintText: hint,
            fillColor: Color.fromARGB(255, 238, 238, 238),
            filled: true,
          ),
        ),
      ),
    );
  }
}
