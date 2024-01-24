// ignore_for_file: public_member_api_docs, sort_constructors_first
// auth provider with provider package

import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/models/token_models.dart';
import 'package:lettutor_mobile_toji/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  late User userLoggedIn;
  late Tokens tokens;
  
  bool _isLogin = false;

  bool get isLogined => _isLogin;

  void setCredentials(String username, String password) {

    notifyListeners();
  }

  void login(User user, Tokens tokens) {
    // Thực hiện xác thực, kiểm tra username và password ở đây
    userLoggedIn = user;
    this.tokens = tokens;
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
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
