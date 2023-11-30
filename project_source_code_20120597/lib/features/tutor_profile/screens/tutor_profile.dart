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
              TutorMainInfo(tutor: tutorProfileProvider.tutor),
              const OptionsOnTutorProfile(),
              VideoPlayerScreen(tutor: tutorProfileProvider.tutor),
              TutorSpecialInfo(tutor: tutorProfileProvider.tutor),
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
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            child: Container(
                          height: 500,
                          child: ListView.builder(
                              itemCount:
                                  tutorProfileProvider.tutor.reviewers.length,
                              itemBuilder: (context, index) {
                                return ReviewComponent(tutorProfileProvider
                                    .tutor.reviewers[index]);
                              }),
                        ))),
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
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          child: Image.asset('assets/common/img_user.png'),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(reviewer.name),
                  ),
                  Container(
                    child: Text(reviewer.time.toIso8601String().split('.')[0]),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
