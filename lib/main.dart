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
      theme: ThemeData(primarySwatch: Colors.deepOrange, fontFamily: "Nunito"),
      home: SplashScreen(),
    );
  }
}
