import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';

class HistoryItem extends StatefulWidget {
  const HistoryItem({super.key});

  @override
  State<StatefulWidget> createState() => HistoryItemState();
}

class HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 208, 209, 212),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Fri, 05 May 2023',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('1 lesson'),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/common/img_user.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keegan',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CountryFlag.fromCountryCode('ES'),
                                ),
                              ),
                              Text('Aruba')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lesson time: 14:30 - 15:25',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Xử lý khi "Requirements for lesson" được ấn
                              showDialog(context: context,builder: (context) {
                                  return AlertDialog(
                                    title: Text('Requirements for lesson'),
                                    content: Text('Requirement'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'Requirements for lesson',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.all(1),
                    child: Text('Tutor has no reviews yet',
                        style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('Evaluate', style: TextStyle(color: primaryColor),)),
                        TextButton(onPressed: () {}, child: const Text('Report', style: TextStyle(color: primaryColor),)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
