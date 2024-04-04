// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  final double w;
  final double h;
  final String t;

  const Mybutton({
    super.key,
    required this.w,
    required this.h,
    required this.t,
  });

  @override
  _MybuttonState createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        width: widget.w,
        height: widget.h,
        child: Center(child: Text(
          widget.t,
        style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        ),
      ),
    );
  }
}
