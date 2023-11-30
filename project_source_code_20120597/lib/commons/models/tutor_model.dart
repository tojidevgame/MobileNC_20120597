
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
    required this.isFavourite
  });
}
