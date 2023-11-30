import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/provider/tutor_profile_provider.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/calendar.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/options_tutor_profile.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/specialize_info.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/tutor_main_info.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/ui_components/video_controller.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorProfile extends StatefulWidget {
  const TutorProfile({Key? key}) : super(key: key);

  @override
  State<TutorProfile> createState() => TutorProfileState();
}

class TutorProfileState extends State<TutorProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var tutorProfileProvider = Provider.of<TutorProfileProvider>(context);
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
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(controller: _tabController, tabs: const [
                    Tab(text: 'Schedule'),
                    Tab(text: 'Review'),
                  ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 500,
                  child: TabBarView(controller: _tabController, children: [
                    Container(
                      child: SfCalendar(
                        dataSource:
                            MeetingDataSource(tutorProfileProvider.schedulings),
                        view: CalendarView.week,
                        appointmentBuilder: (context, details) {
                          return appointmentBuilder(context, details);
                        },
                      ),
                    ),
                    Container(
                      child: const Text('Review'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )));
  }
}

// widget line review with avatar, name, time, rate, comment
// ignore: non_constant_identifier_names
Widget ReviewComponent(Reviewer reviewer) {
  return Container(
    child: Row(
      children: [
        Container(
          child: Image.asset('assets/common/img_user.png'),
        ),
        Container(
          child: Column(
            children: [
              Text('Toai'),
              Text('time'),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      child: Icon(
                        Icons.star,
                        size: 30,
                        color: index < reviewer.rate
                            ? Colors.amber
                            : const Color.fromARGB(255, 78, 78, 78),
                      ),
                    );
                  })),
              Text('comment'),
            ],
          ),
        )
      ],
    ),
  );
}
