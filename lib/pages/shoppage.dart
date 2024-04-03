// ignore_for_file: use_super_parameters, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
    final Color scolor = Color.fromARGB(255, 255, 238, 0);

    return Container(
      color: bgcolor,
      child: Center(child: Text('SHOP PAGE')),
    );
  }
}
