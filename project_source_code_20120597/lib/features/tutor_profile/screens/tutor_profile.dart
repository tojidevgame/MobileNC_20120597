import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/options_tutor_profile.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/specialize_info.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/tutor_main_info.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/video_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
      rate: 4.7,
      numberRate: 2,
      countryCode: 'US',
      education: 'BA',
      language: ['English', 'Vietnamese'],
      specialized: ['specialized', 'hehe'],
      videoPath:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      interest:
          'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
      teachingExperience:
          'I have more than 10 years of teaching english experience',
      isFavourite: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tutor Profile'),
          backgroundColor: primaryColor,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TutorMainInfo(tutor: tutorData as Tutor),
              const OptionsOnTutorProfile(),
              VideoPlayerScreen(tutor: tutorData as Tutor),
              TutorSpecialInfo(tutor: tutorData as Tutor),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý sự kiện khi nút được nhấn
                        _showCalendarPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        side: const BorderSide(color: primaryColor, width: 1.0),
                      ),
                      child: const Text(
                        "Schedule",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }

  void _showCalendarPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SfCalendar(view: CalendarView.day,),
              ],
            ),
          ),
        );
      },
    );
  }
}
  

