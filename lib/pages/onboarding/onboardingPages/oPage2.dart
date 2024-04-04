import 'package:flutter/material.dart';

class OPage2 extends StatelessWidget {
  const OPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    return Container(
      color: bgcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Image.asset('lib/images/repair.png'),
            ),
            Container(
              child: Text(
                'Repair all your Devices',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
