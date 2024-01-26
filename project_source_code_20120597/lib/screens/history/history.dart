import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/widgets/history/history_item.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<StatefulWidget> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(5, 40, 5, 5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/history/history.png',
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'History of lessons',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          width: 2, style: BorderStyle.solid))),
                              padding: const EdgeInsets.all(5),
                              width: 250,
                              child: const Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'This is a list of the lessons you have taken. You can review detailed information about attended sessions',
                                      maxLines: 10,
                                    ),
                                  ),
                                ],
                              ))
                        ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: HistoryItem(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
