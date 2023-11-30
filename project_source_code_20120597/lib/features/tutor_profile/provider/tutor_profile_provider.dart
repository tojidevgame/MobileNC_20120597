

// create class Tutor Profile Provider
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/models/scheduling_model.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';

class TutorProfileProvider extends ChangeNotifier {
  late Tutor tutor;
  late List<Scheduling> schedulings;

  TutorProfileProvider(){
    tutor = Tutor(
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
      isFavourite: false
    );
    schedulings = [
      Scheduling(
        timeStart: DateTime.now().subtract(const Duration(hours: 2, days: 1)),
        timeEnd: DateTime.now().subtract(const Duration(hours: 1, days: 1)),
        note: "note",
        price: 1,
        isBooked: false
      ),
      Scheduling(
        timeStart: DateTime.now().subtract(const Duration(hours: 4, days: 2)),
        timeEnd: DateTime.now().subtract(const Duration(hours: 3, days: 2)),
        note: "note",
        price: 1,
        isBooked: false
      ),
      Scheduling(
        timeStart: DateTime.now().subtract(const Duration(hours: 6, days: 2)),
        timeEnd: DateTime.now().subtract(const Duration(hours: 5, days: 2)),
        note: "note",
        price: 1,
        isBooked: false
      ),];
  }

  void setTutor(Tutor tutor) {
    this.tutor = tutor;
    notifyListeners();
  }

  // book scheduling
  void bookScheduling(Scheduling scheduling) {
    // check if schedulings contain scheduling, if true -> change to booked
    if (schedulings.contains(scheduling)) {
      schedulings[schedulings.indexOf(scheduling)].isBooked = true;
    } 
    notifyListeners();
  }

}