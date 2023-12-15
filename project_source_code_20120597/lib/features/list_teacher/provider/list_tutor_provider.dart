// list tutor provider for list tutor screen
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';

class ListTutorProvider extends ChangeNotifier {
  // constructor for ListTutorProvider
  ListTutorProvider() {
    _tutors = _testListTutor;
    sortTutorResult();
  }

  // test: original list tutor
  final List<Tutor> _testListTutor = [
    
  ];

  List<Tutor> _tutors = [];
  List<Tutor> get tutors => _tutors;

  void sortTutorResult() {
    
  }

  // function filter tutor with specialities
  void filterTutorWithSpecialities(List<String> specialities) {
    if (specialities.isEmpty) {
      _tutors = _testListTutor;
      sortTutorResult();
      notifyListeners();
      return;
    }

    // call to ListTutorProvider
    _tutors = _testListTutor
        .where((tutor) => []
            .any((speciality) => specialities.contains(speciality)))
        .toList();
    sortTutorResult();
    notifyListeners();
  }

  void filterTutorWithName(String name) {
    if (name.isEmpty) {
      _tutors = _testListTutor;
      sortTutorResult();
      notifyListeners();
      return;
    }

    // call to ListTutorProvider
    _tutors = _testListTutor
        .where((tutor) => tutor.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
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
