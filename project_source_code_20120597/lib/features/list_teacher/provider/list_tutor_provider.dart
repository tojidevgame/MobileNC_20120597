// list tutor provider for list tutor screen
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';

class ListTutorProvider extends ChangeNotifier {
  // test: original list tutor
  final List<Tutor> _testListTutor = [
    Tutor(id: '1', name: 'Toai', avatar: 'assets/common/img_user.png', 
          introduce: 'introduce', rate: 5, numberRate: 1500, countryCode: 'US', 
          education: 'education', language: ['English'], 
          specialized: ['Tiếng Anh cho trẻ em', 'KET', 'IELTS'], videoPath: 'videoPath', interest: 'interest', teachingExperience: 'teachingExperience', isFavourite: false),
    Tutor(id: '2', name: 'Toai', avatar: 'assets/common/img_user.png',
          introduce: 'introduce', rate: 3.7, numberRate: 1500, countryCode: 'US',
          education: 'education', language: ['English'], 
          specialized: ['Tiếng Anh cho trẻ em', 'TOELF', 'TOEIC'], videoPath: 'videoPath', interest: 'interest', teachingExperience: 'teachingExperience', isFavourite: false),
  ];

  List<Tutor> _tutors = [];
  List<Tutor> get tutors => _tutors;

  void sortTutorResult(){
      _tutors.sort((Tutor a, Tutor b) {
      // compare isFavourite and rate
      if (a.isFavourite == b.isFavourite) {
        return b.rate.compareTo(a.rate);
      } else {
        return a.isFavourite! ? -1 : 1;
      }
    });
  }

  // function filter tutor with specialities
  void filterTutorWithSpecialities(List<String> specialities) {
    if(specialities.isEmpty) {
      _tutors = _testListTutor;
      sortTutorResult();
      notifyListeners();
      return;
    }

    // call to ListTutorProvider
    _tutors = _testListTutor.where((tutor) => tutor.specialized.any((speciality) => specialities.contains(speciality))).toList();
    sortTutorResult();
    notifyListeners();
  }
}