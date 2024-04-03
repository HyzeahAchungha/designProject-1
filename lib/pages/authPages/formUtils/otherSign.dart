// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class OtherSign extends StatelessWidget {
  const OtherSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'lib/images/googleLogo.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
