import 'package:flutter/material.dart';

class OPage1 extends StatelessWidget {
  const OPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    return Container(
      color: bgcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Image.asset('lib/images/management.png'),
            ),
            Container(
              child: Text(
                'Manage your Business',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none, fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
