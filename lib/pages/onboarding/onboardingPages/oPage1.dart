import 'package:flutter/material.dart';

class OPage1 extends StatelessWidget {
  const OPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Image.asset('lib/images/management.png'),
            ),
            Container(
              child: Text(
                'Manage your Business',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
