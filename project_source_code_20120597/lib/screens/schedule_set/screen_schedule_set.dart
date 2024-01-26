import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/widgets/schedule_set/schedule_detail.dart';

class ScheduleSet extends StatefulWidget {
  const ScheduleSet({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleSetState();
}

class ScheduleSetState extends State<ScheduleSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Image.asset(
                    'assets/schedule/calendar.png',
                    color: primaryColor,
                  ),
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 2, style: BorderStyle.solid))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                      'This is a list of the time slots you have booked. You can track when the class starts, join the class with one click, or you can cancel the class up to 2 hours in advance.'), // Nội dung bên trong Container
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: ScheduleItem(),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
