// ignore_for_file: public_member_api_docs, sort_constructors_first
// auth provider with provider package

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _username;
  String? _password;
  
  bool _isLogin = false;

  String? get username => _username;
  String? get password => _password;
  bool get isLogined => _isLogin;

  void setCredentials(String username, String password) {
    _username = username;
    _password = password;
    notifyListeners();
  }

  void login() {
    // Thực hiện xác thực, kiểm tra username và password ở đây
    if (_username == 'admin@gmail.com' && _password == 'admin') {
      _isLogin = true;
      notifyListeners();
    }
  }

  void logout() {
    _isLogin = false;
    _username = null;
    _password = null;
    notifyListeners();
  }

  void register(String username, String password) {
    // Thực hiện đăng ký tài khoản ở đây
  }

  bool resetPassword(String username) {
    // Thực hiện reset password ở đây
    if(username == 'admin@gmail.com') {
      _isLogin = false;
      notifyListeners();
      return true;
    }
    return false;
  }
}
