// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  _Search_BarState createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  final Color scolor = const Color.fromARGB(255, 255, 238, 0);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              )),
          width: 360,
          height: 42,
          child: const TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        Container(
          height: 42,
          decoration: BoxDecoration(
            color: scolor,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
