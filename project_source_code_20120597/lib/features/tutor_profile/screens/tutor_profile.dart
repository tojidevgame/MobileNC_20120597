import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/options_tutor_profile.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/tutor_main_info.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/video_controller.dart';

class TutorProfile extends StatefulWidget {
  const TutorProfile({Key? key}) : super(key: key);

  @override
  State<TutorProfile> createState() => TutorProfileState();
}

class TutorProfileState extends State<TutorProfile> {
  bool isLoading = true;
  Tutor? tutorData = Tutor(
      id: '1',
      name: 'Toai',
      avatar: 'assets/common/img_user.png',
      introduce:
          'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
      rate: 1,
      numberRate: 2,
      countryCode: 'US',
      language: ['English', 'Vietnamese'],
      specialized: ['specialized', 'hehe'],
      interest: 'interest',
      teachingExperience: 'teachingExperience',
      isFavourite: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TutorMainInfo(tutor: tutorData as Tutor),
              const OptionsOnTutorProfile(),
              VideoPlayerScreen(),
            ],
          ),
        )));
  }
}
