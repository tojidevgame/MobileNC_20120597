// ignore_for_file: public_member_api_docs, sort_constructors_first
// create class Tutor Profile Provider
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/models/scheduling_model.dart';
import 'package:lettutor_mobile_toji/models/tutor_detail_info_model.dart';


class TutorProfileProvider extends ChangeNotifier {
  TutorDetailInfo? tutor;

  late List<Scheduling> schedulings = new List.empty(growable: true);

  void setTutor(TutorDetailInfo tutor) {
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
