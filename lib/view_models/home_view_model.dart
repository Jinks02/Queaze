import 'package:flutter/cupertino.dart';
import 'package:queaze/view_models/services/auth_service_impl.dart';

class HomeViewModel extends ChangeNotifier {
  AuthServiceImpl auth = AuthServiceImpl();

  String getUsername() {
    return auth.currentUser?.displayName ?? " ";
  }


}