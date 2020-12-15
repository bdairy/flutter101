import 'package:MyFirstApp/models/auth-result.dart';
import 'package:MyFirstApp/services/api.service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuth = true;
  ApiService _service = ApiService();
  AuthResult _token;
  bool get isAuthenticated {
   // return _token != null && DateTime.now().isBefore(_token.expiryTime);
   return true;
  }

  Future<AuthResult> login(String email, String password) async {
    _token = await _service.login(email, password);

    notifyListeners();
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
