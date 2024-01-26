import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/providers/authprovider.dart';
import 'package:lettutor_mobile_toji/screens/authentication/login_screen.dart';
import 'package:lettutor_mobile_toji/providers/list_tutor_provider.dart';
import 'package:lettutor_mobile_toji/providers/profile_provider.dart';
import 'package:lettutor_mobile_toji/providers/tutor_profile_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<ListTutorProvider>(create: (context) => ListTutorProvider()),
        ChangeNotifierProvider<TutorProfileProvider>(create: (context) => TutorProfileProvider()),
        ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider())
      ],
      child: MaterialApp(
          title: 'LetTutor',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen()),
    );
  }
}
