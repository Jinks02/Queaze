import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:queaze/view_models/services/auth_service.dart';

class SignInWithAppleViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<UserCredential?> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    UserCredential? userCredential = await _authService.signInWithApple();
    _isLoading = false;
    notifyListeners();
    return userCredential;
  }
}
