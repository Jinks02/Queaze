import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  String _email = "";
  String _password = "";
  String _name = "";

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 14);
    TextStyle linkStyle = TextStyle(color: Colors.green);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 300,
                  child: SvgPicture.asset(
                    "assets/images/login_page.svg",
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Signup",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Enter your details for new account",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration:
                  const InputDecoration(hintText: "Enter your name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value!.isNotEmpty) {
                      _name = value;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                  const InputDecoration(hintText: "Enter your email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value!.isNotEmpty) {
                      _email = value;
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    //labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value!.isNotEmpty) {
                      _password = value;
                    }
                  },
                ),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: defaultStyle,
                      children: <TextSpan>[
                        const TextSpan(text: 'By continuing you agree to our'),
                        TextSpan(
                            text: 'Terms of Service \n',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service');
                              }),
                        const TextSpan(text: 'and '),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy Policy"');
                              }),
                      ],
                    ),
                  )
                ),
                const SizedBox(height: 15.0),
                Center(
                  child: Container(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //TODO: perform login with _email and _password
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
