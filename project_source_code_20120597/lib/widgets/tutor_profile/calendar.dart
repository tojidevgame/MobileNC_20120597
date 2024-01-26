import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/models/scheduling_model.dart';
import 'package:lettutor_mobile_toji/providers/tutor_profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Scheduling> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].timeStart;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].timeEnd;
  }

  @override
  String getSubject(int index) {
    return "";
  }

  @override
  Color getColor(int index) {
    return primaryColor;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}

Widget appointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  return !calendarAppointmentDetails.appointments.first.isBooked
      ? ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return BookDialog(
                      calendarAppointmentDetails.appointments.first,
                      context);
                });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(0.0),
          ),
          child: const Text(
            "Book",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )
      : const Text(
          "Booked",
          style: TextStyle(color: Colors.green, fontSize: 10),
        );
}

// ignore: non_constant_identifier_names
Widget BookDialog(Scheduling scheduling, BuildContext context) {
  var tutorProfileProvider = Provider.of<TutorProfileProvider>(context);
  return Dialog(
    child: Container(
      height: 400,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      // title, time book,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Scheduling Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Schedule time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // Text time start and time end from scheduling
                  Text(
                      "${scheduling.timeStart.hour}:${scheduling.timeStart.minute} - ${scheduling.timeEnd.hour}:${scheduling.timeEnd.minute} ${scheduling.timeStart.day}/${scheduling.timeStart.month}/${scheduling.timeStart.year}"),
                ],
              )),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Surplus",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Text note from scheduling
                      Text("9612"),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      // Text note from scheduling
                      Text("${scheduling.price}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Note"),
                  // Text note from scheduling
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(scheduling.note),
                  )
                ]),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // button cancel and button book
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    tutorProfileProvider.bookScheduling(scheduling);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Text(
                    "Book",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

