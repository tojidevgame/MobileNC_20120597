import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/features/course_info/screens/course_info.dart';
import 'package:lettutor_mobile_toji/features/history/screens/history.dart';
import 'package:lettutor_mobile_toji/features/lesson_detail/screens/lesson_detail.dart';
import 'package:lettutor_mobile_toji/features/list_course/screens/list_course.dart';
import 'package:lettutor_mobile_toji/features/login/screens/screen_login.dart';
import 'package:lettutor_mobile_toji/features/schedule_set/screens/screen_schedule_set.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/screens/tutor_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LetTutor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen());
  }
}
