import 'package:lettutor_mobile_toji/commons/models/user_model.dart';

class Tutor extends UserModel {
  String introduce;
  double rate;
  int numberRate;
  String countryCode;
  String education;
  List<String> language;
  List<String> specialized;
  String videoPath;
  String interest;
  String teachingExperience;
  bool isFavourite = false;

  late List<Reviewer> reviewers;

  Tutor(
      {required id,
      required name,
      required avatar,
      required this.introduce,
      required this.rate,
      required this.numberRate,
      required this.countryCode,
      required this.education,
      required this.language,
      required this.specialized,
      required this.videoPath,
      required this.interest,
      required this.teachingExperience,
      required this.isFavourite,
      required this.reviewers,
      required phone,
      required email,
      required country,
      required birthday,
      required level,
      required wantToLearn,
      required schedule})
      : super(
            id: id,
            name: name,
            avatar: avatar,
            phone: phone,
            email: email,
            country: country,
            birthday: birthday,
            level: level,
            wantToLearn: wantToLearn,
            schedule: schedule);

  void setReviewers(List<Reviewer> reviewers) {
    this.reviewers = reviewers;
  }
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
