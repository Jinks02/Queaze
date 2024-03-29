import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queaze/view/core_screens/home_screen.dart';
import 'package:queaze/view_models/otp_auth_view_model.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({Key? key}) : super(key: key);

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  final _focusNode = FocusNode();
  final _otpController = TextEditingController();
  // String otpCode = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _otpController.clear();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 20, left: 25),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            // Add your onPressed handler here
          },
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        final alignment = orientation == Orientation.portrait
            ? Alignment.centerRight
            : Alignment.center;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Enter your 6-digit code",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Code",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextFormField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 20),
                    maxLength: 6,
                    focusNode: _focusNode,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      // prefixText: '- - - -',
                      prefixStyle: TextStyle(color: Colors.black),
                      // contentPadding: EdgeInsets.only(left: 16),
                      hintText: '- - - - - -',
                      counterText: '',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the OTP code';
                      } else if (value.isNotEmpty) {
                        _otpController.text = value;
                      } else if (value.length != 6) {
                        return 'The OTP code must be 6 digits';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Align(
                    alignment: alignment,
                    child: InkWell(
                      onTap: () {
                        // todo: resend code functionality
                      },
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: Consumer<OtpAuthViewModel>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30.0, right: 10),
            child: FloatingActionButton(
              onPressed: () async {
                UserCredential? userCredential = await value.signInWithOTP(
                    value.verificationId, _otpController.text);
                log(value.verificationId.isEmpty.toString());
                log(_otpController.text);
                if (userCredential != null) {
                  // todo: find an alternative to scaffold messenger
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("otp auth success")));
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("otp auth failed")));
                }
              },
              backgroundColor: Colors.orange,
              child: value.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
