// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/models/feed_back.dart';
import 'package:lettutor_mobile_toji/models/tutor_detail_info_model.dart';
import 'package:lettutor_mobile_toji/providers/authprovider.dart';
import 'package:lettutor_mobile_toji/services/tutor_service.dart';
import 'package:lettutor_mobile_toji/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/providers/tutor_profile_provider.dart';
import 'package:lettutor_mobile_toji/widgets/tutor_profile/calendar.dart';
import 'package:lettutor_mobile_toji/widgets/tutor_profile/options_tutor_profile.dart';
import 'package:lettutor_mobile_toji/widgets/tutor_profile/specialize_info.dart';
import 'package:lettutor_mobile_toji/widgets/tutor_profile/tutor_main_info.dart';
import 'package:lettutor_mobile_toji/widgets/tutor_profile/video_controller.dart';

class TutorProfile extends StatefulWidget {
  final String tutorId;
  const TutorProfile({
    Key? key,
    required this.tutorId,
  }) : super(key: key);

  @override
  State<TutorProfile> createState() => TutorProfileState();
}

class TutorProfileState extends State<TutorProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool isLoading = true;
  late TutorDetailInfo tutor = TutorDetailInfo.createDefault();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getTutorInfo();
  }

  void getTutorInfo() async{
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    tutor = await TutorService.getTutorById(widget.tutorId, authProvider.tokens.access.token);
    var tutorProfileProvider = Provider.of<TutorProfileProvider>(context, listen: false);
    tutorProfileProvider.setTutor(tutor);

    setState(() {
      isLoading = false;
    });
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
          child: isLoading ? const LoadingWidget() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TutorMainInfo(tutor: tutor),
              const OptionsOnTutorProfile(),
              VideoPlayerScreen(tutor: tutor),
              TutorSpecialInfo(tutor: tutor),
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
                              // itemCount:
                              //     tutorProfileProvider.tutor.reviewers.length,
                              // itemBuilder: (context, index) {
                              //   return ReviewComponent(tutorProfileProvider
                              //       .tutor.reviewers[index]);
                              // }),
                              itemCount:
                                  5,
                              itemBuilder: (context, index) {
                                // return ReviewComponent(Feedback(name: "name", avatar: "avatar", comment: "comment", rate: 4, time: DateTime.now()));
                                return null;
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
Widget ReviewComponent(FeedBackModel reviewer) {
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
                    child: Text(reviewer.firstInfo.name),
                  ),
                  Container(
                    child: Text(reviewer.createdAt),
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
                        color: index < reviewer.rating
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
