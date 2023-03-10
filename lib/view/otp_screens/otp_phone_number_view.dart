import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OtpPhoneNumberView extends StatefulWidget {
  const OtpPhoneNumberView({Key? key}) : super(key: key);

  @override
  State<OtpPhoneNumberView> createState() => _OtpPhoneNumberViewState();
}

class _OtpPhoneNumberViewState extends State<OtpPhoneNumberView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              height: 350,
              child: SvgPicture.asset(
                "assets/images/login_page.svg",
              ),
            ),
            const Text(
              "Enter your Phone Number",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  debugPrint(phone.completeNumber);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, right: 10),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
