import 'package:flutter/material.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({Key? key}) : super(key: key);

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.clear();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter your 4-digit code",
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
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 20),
                  maxLength: 4,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    // prefixText: '- - - -',
                    prefixStyle: TextStyle(color: Colors.black),
                    // contentPadding: EdgeInsets.only(left: 16),
                    hintText: '- - - -',
                    counterText: '',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the OTP code';
                    } else if (value.length < 4) {
                      return 'The OTP code must be 4 digits';
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
                  alignment: Alignment.centerRight,
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
