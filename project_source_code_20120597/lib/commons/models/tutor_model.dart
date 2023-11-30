
class Tutor {
  String id;
  String name;
  String avatar;
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

  Tutor({
    required this.id, 
    required this.name,
    required this.avatar,
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
    required this.reviewers
  });

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

  Reviewer({
    required this.name,
    required this.avatar,
    required this.comment,
    required this.rate,
    required this.time
  });
}
