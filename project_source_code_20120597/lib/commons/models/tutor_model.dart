import 'package:lettutor_mobile_toji/commons/models/user_model/user_model.dart';

class Tutor extends User {
  Tutor({required super.id, required super.email, required super.name, required super.avatar, required super.country, required super.phone, required super.roles, required super.birthday, required super.isActivated, required super.walletInfo, required super.courses, required super.requireNote, required super.level, required super.learnTopics, required super.testPreparations, required super.isPhoneActivated, required super.timezone, required super.studySchedule, required super.canSendMessage});

}

class Reviewer {
  // public properties name, string avatar, string comment, double rate
  String name;
  String avatar;
  String comment;
  double rate;
  DateTime time;

  Reviewer(
      {required this.name,
      required this.avatar,
      required this.comment,
      required this.rate,
      required this.time});
}
