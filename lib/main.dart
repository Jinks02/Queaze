import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queaze/view/onBoarding/splash_view.dart';
import 'package:queaze/view_models/home_view_model.dart';
import 'package:queaze/view_models/log_in_view_model.dart';
import 'package:queaze/view_models/otp_auth_view_model.dart';
import 'package:queaze/view_models/sign_in_with_apple_view_model.dart';
import 'package:queaze/view_models/sign_in_with_google_view_model.dart';
import 'package:queaze/view_models/sign_up_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => HomeViewModel()
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpAuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInWithAppleViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInWithGoogleViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        ),
      ],
      child: MaterialApp(
        title: "Queaze",
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            primaryColor: const Color.fromRGBO(255, 145, 77, 1),
            fontFamily: "Nunito"),
        home: SplashScreen(),
      ),
    );
  }
}
