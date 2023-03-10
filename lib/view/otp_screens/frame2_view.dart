import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Frame2View extends StatefulWidget {
  const Frame2View({Key? key}) : super(key: key);

  @override
  State<Frame2View> createState() => _Frame2ViewState();
}

class _Frame2ViewState extends State<Frame2View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              height: 300,
              child: SvgPicture.asset(
                "assets/images/login_page.svg", // todo: fix frame 2 image error
              ),
            ),
            const Text(
              "No more waiting in lines\n - pay with QueueEaZe!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                Positioned(
                  right: 25,
                  top: -25,
                  bottom: 5,
                  child: InkWell(
                    onTap: () {
                      // todo implement navigation when provided with phone number
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              "Or connect with social media",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/google_logo.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign in with Apple',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/apple_logo2.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
