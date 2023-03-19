import 'package:flutter/material.dart';
import 'package:queaze/view/onBoarding/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Queaze",
      theme: ThemeData(primarySwatch: Colors.deepOrange, primaryColor: const Color.fromRGBO(255, 145, 77, 1), fontFamily: "Nunito"),
      home: SplashScreen(),
    );
  }
}
