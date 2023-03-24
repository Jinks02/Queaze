import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:queaze/view/login/login.dart';
import 'package:queaze/view/login/signup.dart';
import 'package:queaze/view/otp_screens/otp_phone_number_view.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          width: double.infinity,
          child: const Text(
            "Image Placeholder",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: const Text(
                  "Skip the queue, pay with ease!",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50, top: 30),
                child: const Text(
                  "Ger your groceries in as fast as one hour",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Button Clicked");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 48),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xffE3DEDE),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(platform: defaultTargetPlatform),
                            child: defaultTargetPlatform ==
                                    TargetPlatform.android
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 28.0),
                                    child: InkWell(
                                      onTap: () {
                                        debugPrint("google icon clicked");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/google_logo.svg',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(right: 28),
                                    child: InkWell(
                                      onTap: () {
                                        debugPrint("apple icon clicked");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/apple_logo_dark.svg',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: InkWell(
                              onTap: () {
                                debugPrint("phone icon clicked");
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => OtpPhoneNumberView(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 22,
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
