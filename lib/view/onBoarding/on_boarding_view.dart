import 'package:flutter/material.dart';
import 'package:queaze/view/onBoarding/get_started_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 60),
        margin: const EdgeInsets.only(bottom: 100),
        child: PageView(
          controller: _pageController,
          children: [
            Container(
              color: Colors.red,
              child: const Center(
                child: Text('Page 1'),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Page 3'),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.yellow),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(_createRoute());
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Nunito",
                        fontSize: 22),
                  ),
                ),
              ],
            ),
            RawMaterialButton(
              onPressed: () {
                if (_pageController.page == 2) {
                  Navigator.of(context).push(_createRoute());
                } else {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              elevation: 2.0,
              highlightElevation: 8.0,
              shape: const CircleBorder(),
              fillColor: Colors.yellow,
              highlightColor: Colors.grey[100],
              padding: const EdgeInsets.all(15.0),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => GetStarted(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
