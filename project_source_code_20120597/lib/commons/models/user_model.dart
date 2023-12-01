// ignore_for_file: public_member_api_docs, sort_constructors_first
// create class user model
class UserModel {
  final String id;
  final String name;
  final String avatar;
  final String phone;
  final String email;
  final String country;
  final DateTime birthday;
  final String level;
  final List<String> wantToLearn;
  final String schedule;


  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.phone,
    required this.email,
    required this.country,
    required this.birthday,
    required this.level,
    required this.wantToLearn,
    required this.schedule,
  });

}
