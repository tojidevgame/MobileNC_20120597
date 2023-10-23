// ignore_for_file: avoid_print

class Tutor {
  String id;
  String name;
  String avatar;
  String introduce;
  int rate;
  int numberRate;
  String countryCode;
  List<String> language;
  List<String> specialized;
  String interest;
  String teachingExperience;
  bool? isFavourite;

  Tutor({
    required this.id, 
    required this.name,
    required this.avatar,
    required this.introduce,
    required this.rate,
    required this.numberRate,
    required this.countryCode,
    required this.language,
    required this.specialized,
    required this.interest,
    required this.teachingExperience,
    required this.isFavourite
  });
}
