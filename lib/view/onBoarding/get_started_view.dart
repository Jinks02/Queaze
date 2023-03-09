import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queaze/view/login/login.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 250),
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
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 55),
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
