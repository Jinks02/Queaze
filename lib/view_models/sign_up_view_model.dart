import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:queaze/view_models/services/auth_service.dart';
import 'package:queaze/view_models/services/auth_service_impl.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthService _authService = AuthServiceImpl();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    _isLoading = true;
    notifyListeners();
    UserCredential? userCredential = await _authService.signUp(email, password);
    _isLoading = false;
    notifyListeners();
    return userCredential;
  }
}
