// list tutor provider for list tutor screen
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/models/tutor_detail_info_model.dart';

class ListTutorProvider extends ChangeNotifier {
  // constructor for ListTutorProvider
  ListTutorProvider() {
    sortTutorResult();
  }

  List<TutorDetailInfo> _tutors = [];
  List<TutorDetailInfo> get tutors => _tutors;

  // public set _tutor
  set tutors(List<TutorDetailInfo> tutors) {
    _tutors = tutors;
    sortTutorResult();
    notifyListeners();
  }

  void sortTutorResult() {
    
  }

  // function filter tutor with specialities
  void filterTutorWithSpecialities(List<String> specialities) {
    sortTutorResult();
    notifyListeners();
  }

  void filterTutorWithName(String name) {
    if (name.isEmpty) {
      sortTutorResult();
      notifyListeners();
      return;
    }
    sortTutorResult();
    notifyListeners();
  }

  void filterTutorWithCountry(List<String> selectionCountry) {
    // if (selectionCountry.contains('Gia Sư Việt Nam')) {
    //   _tutors =
    //       _testListTutor.where((tutor) => tutor.countryCode == 'VN').toList();
    //   sortTutorResult();
    //   notifyListeners();
    // }
    // if (selectionCountry.contains('Gia Sư Nước Ngoài')) {
    //   _tutors.addAll(
    //       _testListTutor.where((tutor) => tutor.countryCode != 'VN').toList());
    //   sortTutorResult();
    //   notifyListeners();
    // }
    // if (selectionCountry.contains('Gia Sư Tiếng Anh Bản Ngữ')) {
    //   _tutors.addAll(
    //       _testListTutor.where((tutor) => tutor.countryCode == 'US').toList());
    //   sortTutorResult();
    //   notifyListeners();
    //   return;
    // }
  }
}
