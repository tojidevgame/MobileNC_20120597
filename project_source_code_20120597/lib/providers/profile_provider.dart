// ignore_for_file: public_member_api_docs, sort_constructors_first

// class provider for user profile, store UserModel
import 'package:flutter/material.dart';

import 'package:lettutor_mobile_toji/models/user_model.dart';

class ProfileProvider extends ChangeNotifier {
  late User userModel;

  ProfileProvider() {
  }

  void updateProfile(User userModel) {
    this.userModel = userModel;
    notifyListeners();
  }
}
