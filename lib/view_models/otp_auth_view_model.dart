import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:queaze/view_models/services/auth_service.dart';
import 'package:queaze/view_models/services/auth_service_impl.dart';

class OtpAuthViewModel extends ChangeNotifier {
  AuthService authService = AuthServiceImpl();

  OtpAuthViewModel({required this.authService});

  String phoneNumber = '';
  String verificationId = '';
  String smsCode = '';
  String errorMessage = '';

  User? get currentUser => authService.currentUser;

  Future<void> verifyPhoneNumber() async {
    try {
      await authService.signInWithPhoneNumber(phoneNumber);
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      final UserCredential? userCredential =
          await authService.signInWithOTP(verificationId, smsCode);
      if (userCredential != null) {
        // success
      } else {
        errorMessage = 'Sign in failed';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
