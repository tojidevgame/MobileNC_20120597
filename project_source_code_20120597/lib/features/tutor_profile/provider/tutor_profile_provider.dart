// create class Tutor Profile Provider
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/models/scheduling_model.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';

class TutorProfileProvider extends ChangeNotifier {
  late Tutor tutor;
  late List<Scheduling> schedulings;

  TutorProfileProvider() {
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

  // favorite tutor
  void favoriteTutor() {
    notifyListeners();
  }
}
