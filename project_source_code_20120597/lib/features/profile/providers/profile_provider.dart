// ignore_for_file: public_member_api_docs, sort_constructors_first

// class provider for user profile, store UserModel
import 'package:flutter/material.dart';

import 'package:lettutor_mobile_toji/commons/models/user_model.dart';

class ProfileProvider extends ChangeNotifier {
  late UserModel userModel;

  ProfileProvider() {
    userModel = UserModel(
        id: '1',
        name: 'Nguyen Van A',
        email: '',
        avatar: '',
        phone: '',
        country: '',
        birthday: DateTime.now(),
        level: '',
        wantToLearn: [],
        schedule: '');
  }

  void updateProfile(UserModel userModel) {
    this.userModel = userModel;
    notifyListeners();
  }
}
