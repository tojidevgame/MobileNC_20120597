import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/screens/screen_list_teacher.dart';
//import 'package:lettutor_mobile_toji/features/login/screens/screen_login.dart';

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
      home: const TutorScreen()
    );
  }
}

