import 'package:flutter/material.dart';
import 'package:queaze/view/get_started_view.dart';
import 'package:video_player/video_player.dart';

import 'on_boarding_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/splash_video_light.mp4')
          ..initialize().then((_) {
            setState(() {
              _isVideoInitialized = true;
            });
            _controller.play();
          });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isVideoInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: Text("Skip the queue, pay with ease!",
              style: TextStyle(fontSize: 18,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold),) //Image.asset('assets/app_logo.png'),
              ),
        ],
      ),
    );
  }
}
