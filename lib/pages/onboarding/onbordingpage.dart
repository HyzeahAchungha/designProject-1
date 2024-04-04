import 'package:flutter/material.dart';
import 'package:lite_store/pages/onboarding/onboardingPages/oPage1.dart';
import 'package:lite_store/pages/onboarding/onboardingPages/oPage2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbordingpage extends StatefulWidget {
  const Onbordingpage({Key? key}) : super(key: key);

  @override
  State<Onbordingpage> createState() => _OnbordingpageState();
}

class _OnbordingpageState extends State<Onbordingpage> {
  // keep track of page....
  PageController _controller = PageController();
  bool onLastPage = false;
  final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 1);
              });
            },
            controller: _controller,
            children: [
              OPage1(),
              OPage2(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip btn...
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                  child: Text('Skip'),
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: ExpandingDotsEffect(),
                ),

                //next or done btn...
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/auth');
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Next'),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
