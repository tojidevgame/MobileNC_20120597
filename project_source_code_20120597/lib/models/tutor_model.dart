// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tutor {
  String? level;
  String email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  late bool requestPassword;
  bool isActivated;
  bool? isPhoneActivated;
  bool? requireNote;
  late int? timezone;
  String? phoneAuth;
  bool isPhoneAuthActivated;
  String? studySchedule;
  bool canSendMessage;
  bool isPublicRecord;
  String? caredByStaffId;
  String? zaloUserId;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  String? studentGroupId;
  List<FeedbackModel> feedbacks;
  String id;
  String userId;
  String video;
  String bio;
  String education;
  String experience;
  String profession;
  String? accent;
  String targetStudent;
  String interests;
  String languages;
  String specialties;
  String? resume;
  late double? rating;
  bool? isNative;
  String? youtubeVideoId;
  late int? price;
  bool? isOnline;
  Tutor({
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.zaloUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
    required this.feedbacks,
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.resume,
    required this.rating,
    required this.isNative,
    required this.youtubeVideoId,
    required this.price,
    required this.isOnline,
  });


  
  
  // method fromJson
  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      level: json['level'],
      email: json['email'],
      google: json['google']?.cast<String>(),
      facebook: json['facebook']?.cast<String>(),
      apple: json['apple']?.cast<String>(),
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      requestPassword: json['requestPassword'],
      isActivated: json['isActivated'],
      isPhoneActivated: json['isPhoneActivated'],
      requireNote: json['requireNote'],
      timezone: json['timezone'],
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
      feedbacks: List<FeedbackModel>.from(json['feedbacks'].map((x) => FeedbackModel.fromJson(x))),
      id: json['id'],
      userId: json['userId'],
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'],
      specialties: json['specialties'],
      resume: json['resume'],
      rating: json['rating'],
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
      price: json['price'],
      isOnline: json['isOnline'],
    );
  }
}

class FeedbackModel {
  String id;
  String? bookingId;
  String firstId;
  String secondId;
  late int rating;
  String content;
  String createdAt;
  String updatedAt;
  FirstInfo firstInfo;
  FeedbackModel({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });

  // method fromJson
  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      bookingId: json['bookingId'],
      firstId: json['firstId'],
      secondId: json['secondId'],
      rating: json['rating'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      firstInfo: FirstInfo.fromJson(json['firstInfo']),
    );
  }
}

// create class FirstInfo
class FirstInfo {
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  String? phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? zaloUserId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? studentGroupId;
  FirstInfo({
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.zaloUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
  });

  // method fromJson
  factory FirstInfo.fromJson(Map<String, dynamic> json) {
    return FirstInfo(
      level: json['level'],
      email: json['email'],
      google: json['google'],
      facebook: json['facebook'],
      apple: json['apple'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      requestPassword: json['requestPassword'],
      isActivated: json['isActivated'],
      isPhoneActivated: json['isPhoneActivated'],
      requireNote: json['requireNote'],
      timezone: json['timezone'],
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      studentGroupId: json['studentGroupId'],
    );
  }
  
}
