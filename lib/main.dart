
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queaze/view/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Queaze",
      home: SplashScreen(),
    );
  }

}