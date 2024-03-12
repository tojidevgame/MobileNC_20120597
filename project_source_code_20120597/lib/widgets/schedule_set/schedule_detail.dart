import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class ScheduleItem extends StatefulWidget {
  const ScheduleItem({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScheduleItemState();
}

class ScheduleItemState extends State<ScheduleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 208, 209, 212),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('Fri, 05 May 2023', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Text('Keegan', style: const TextStyle(fontWeight: FontWeight.bold),),
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
                  Text('Lesson time: 14:30 - 15:25', style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('05:30 - 05:55'),
                        TextButton(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            side: MaterialStateProperty.all(BorderSide(color: Colors.red, width: 2.0)), // Màu khi nhấn
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Điều chỉnh độ cong viền
                            )),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.close, // Biểu tượng "X"
                                color: Colors.red, // Màu biểu tượng
                              ),
                              Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.red), // Màu chữ "Cancel"
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Xử lý khi "Requirements for lesson" được ấn
                              showDialog(
                                context: context,
                                builder: (context) {
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
                            child: Row(
                              children: [
                                Icon(Icons.chevron_right), // Biểu tượng ">"
                                Text('Requirements for lesson', style: TextStyle(fontSize: 12),),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Xử lý khi "Edit Request" được ấn
                            },
                            child: Text('Edit Request', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Go to Meeting'),
                      ),
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
