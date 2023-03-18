import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:queaze/view/onBoarding/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
