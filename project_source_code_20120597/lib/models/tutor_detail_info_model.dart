// ignore_for_file: public_member_api_docs, sort_constructors_first

class TutorDetailInfo {
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  List<String> specialties;
  double? rating;
  bool? isNative;
  String? youtubeVideoId;
  User user;
  bool? isFavorite;
  double? avgRating;
  int totalFeedback;

  TutorDetailInfo({
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
    required this.rating,
    required this.isNative,
    required this.youtubeVideoId,
    required this.user,
    required this.isFavorite,
    required this.avgRating,
    required this.totalFeedback,
  });

  factory TutorDetailInfo.fromJson(Map<String, dynamic> json) {
    return TutorDetailInfo(
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      accent: json['accent'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'],
      specialties: json['specialties'].toString().split(","),
      rating: json['rating']?.toDouble(),
      isNative: json['isNative'],
      youtubeVideoId: json['youtubeVideoId'],
      user: User.fromJson(json['User']),
      isFavorite: json['isFavorite'],
      avgRating: json['avgRating']?.toDouble(),
      totalFeedback: json['totalFeedback'],
    );
  }

  // method create default data
  static TutorDetailInfo createDefault() {
    return TutorDetailInfo(
      video: '',
      bio: '',
      education: '',
      experience: '',
      profession: '',
      accent: '',
      targetStudent: '',
      interests: '',
      languages: '',
      specialties: [],
      rating: 0,
      isNative: false,
      youtubeVideoId: '',
      user: User(
        id: '',
        level: '',
        avatar: '',
        name: '',
        country: '',
        language: '',
        isPublicRecord: false,
        caredByStaffId: '',
        zaloUserId: '',
        studentGroupId: '',
        courses: [],
      ),
      isFavorite: false,
      avgRating: 0,
      totalFeedback: 0,
    );
  }
}

class User {
  String id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool isPublicRecord;
  String? caredByStaffId;
  String? zaloUserId;
  String? studentGroupId;
  List<Course> courses;

  User({
    required this.id,
    required this.level,
    required this.avatar,
    required this.name,
    required this.country,
    required this.language,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.zaloUserId,
    required this.studentGroupId,
    required this.courses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List;
    List<Course> courses = courseList.map((course) => Course.fromJson(course)).toList();

    return User(
      id: json['id'],
      level: json['level'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      language: json['language'],
      isPublicRecord: json['isPublicRecord'],
      caredByStaffId: json['caredByStaffId'],
      zaloUserId: json['zaloUserId'],
      studentGroupId: json['studentGroupId'],
      courses: courses,
    );
  }
}

class Course {
  String? id;
  String? name;
  TutorCourse tutorCourse;

  Course({
    required this.id,
    required this.name,
    required this.tutorCourse,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      tutorCourse: TutorCourse.fromJson(json['TutorCourse']),
    );
  }
}

class TutorCourse {
  String? userId;
  String? courseId;
  String? createAt;
  String? updateAt;
  TutorCourse({
    required this.userId,
    required this.courseId,
    required this.createAt,
    required this.updateAt,
  });

  // fromJson method
  factory TutorCourse.fromJson(Map<String, dynamic> json) {
    return TutorCourse(
      userId: json['UserId'],
      courseId: json['CourseId'],
      createAt: json['CreateAt'],
      updateAt: json['UpdateAt'],
    );
  }
}
