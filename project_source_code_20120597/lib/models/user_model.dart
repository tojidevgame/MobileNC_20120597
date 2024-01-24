// ignore_for_file: public_member_api_docs, sort_constructors_first
// create class user model
import 'package:lettutor_mobile_toji/models/learn_topic_model.dart';
import 'package:lettutor_mobile_toji/models/test_prepare_model.dart';
import 'package:lettutor_mobile_toji/models/wallet_model.dart';

class User {
  late String id;
  late String email;
  late String name;
  late String avatar;
  String? country;
  String? phone;
  late List<String>? roles;
  String? language;
  late DateTime birthday;
  late bool isActivated;
  late Wallet walletInfo;
  late List<String> courses;
  late String? requireNote;
  late String? level;
  late List<LearnTopic> learnTopics;
  late List<TestPreparation>? testPreparations;
  late bool? isPhoneActivated;
  late int? timezone;
  late String? studySchedule;
  late bool? canSendMessage;

  // constructor
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
  });

  //fromJson method
  User.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles']?.cast<String>();
    birthday = DateTime.parse(json['birthday']);
    isActivated = json['isActivated'];
    walletInfo = Wallet.fromJson(json['walletInfo']);
    courses = json['courses']?.cast<String>();
    requireNote = json['requireNote'];
    level = json['level'];
    learnTopics = json['learnTopics'].map<LearnTopic>((e) => LearnTopic.fromJson(e)).toList();
    testPreparations = json['testPreparations'].map<TestPreparation>((e) => TestPreparation.fromJson(e)).toList();
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['birthday'] = birthday.toIso8601String();
    data['isActivated'] = isActivated;
    data['wallet'] = walletInfo.toJson();
    data['courses'] = courses;
    data['requireNote'] = requireNote;
    data['level'] = level;
    data['learnTopics'] = learnTopics.map((e) => e.toJson()).toList();
    data['testPreparations'] = testPreparations;
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    data['studySchedule'] = studySchedule;
    data['canSendMessage'] = canSendMessage;
    return data;
  }
}
