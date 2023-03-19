import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(bottom: 60),
        margin: EdgeInsets.only(
            bottom: 100, top: MediaQuery.of(context).viewPadding.top),
        child: PageView(
          controller: _pageController,
          children: [
            Stack(
              children: [
                Align(
                  alignment: const Alignment(-1.4, 0.7),
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 145, 77, 1)),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.4, 0.95),
                  child: Container(
                    width: width * 0.25,
                    height: width * 0.25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 145, 77, 1)),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.5, -0.4),
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 145, 77, 1)),
                  ),
                ),
                Center(
                  child: LottieBuilder.network(
                    "https://assets1.lottiefiles.com/packages/lf20_5ngs2ksb.json",
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "No more waiting, scan add\nand checkout!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 145, 77, 1)),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: const Alignment(-1.26, 0.95),
                  child: Container(
                    width: width * 0.25,
                    height: width * 0.25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1.83, -0.4),
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.4, 0.8),
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: LottieBuilder.network(
                    "https://assets3.lottiefiles.com/packages/lf20_yM5Jk6TqN0.json",
                  ),
                ),
                // Align(
                //   alignment: const Alignment(-0.8, 0.8),
                //   child: LottieBuilder.network(
                //     height: height * 0.35,
                //     "https://assets2.lottiefiles.com/packages/lf20_UnfRpxwc6d.json",
                //   ),
                // ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 60),
                    child: Text(
                      "Say goodbye to long\nqueues forever!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 145, 77, 1)),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: const Alignment(-1.88, 0.8),
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.4, 0.9),
                  child: Container(
                    width: width * 0.3,
                    height: width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.3),
                  child: LottieBuilder.network(
                      "https://assets9.lottiefiles.com/packages/lf20_ml0yft0o.json"),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 60),
                    child: Text(
                      "No more waiting in lines\npay with QuEaZe!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 145, 77, 1)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const WormEffect(
                          spacing: 16,
                          dotColor: Color.fromRGBO(255, 145, 77, 0.2),
                          activeDotColor: Colors.deepOrangeAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(_createRoute());
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 145, 77, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "SF Pro",
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 4,
                  )),
              child: RawMaterialButton(
                onPressed: () {
                  if (_pageController.page == 2) {
                    Navigator.of(context).push(_createRoute());
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                },
                elevation: 2.0,
                highlightElevation: 8.0,
                shape: const CircleBorder(),
                fillColor: Colors.orange,
                highlightColor: Colors.grey[100],
                padding: const EdgeInsets.all(15.0),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 24.0,
                ),
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
