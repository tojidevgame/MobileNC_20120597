// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Scheduling extends CalendarDataSource  {
  // public properties time start, time end, note, price
  DateTime timeStart;
  DateTime timeEnd;
  String note;
  int price;

  late bool isBooked;

  // constructor
  Scheduling({
    required this.timeStart,
    required this.timeEnd,
    required this.note,
    required this.price,
    this.isBooked = false
  });


  @override
  bool operator ==(Object other) {
    return other is Scheduling &&
      other.timeStart == timeStart &&
      other.timeEnd == timeEnd;
  }
}