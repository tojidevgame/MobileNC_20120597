import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/widgets/course_detail/course_card_item.dart';

class CourseInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseInfoState();
}

class CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/course/course_avatar.png'),
            const Text(
              'Life in the Internet Age',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const Text(
                'Let\'s discuss how technology is changing the way we live',
                style: TextStyle(fontSize: 12, color: Colors.black)),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấn
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Đặt màu nền cho nút là xanh dương
                ),
                child: const Text(
                  'Discover',
                  style: TextStyle(
                      color: Colors.white), // Đặt màu văn bản là trắng
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: const Text(
                'Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.help_outline_outlined,
                    color: Colors.red,
                  ),
                  Text(
                    'Why should you study this course?',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                  'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.help_outline_outlined,
                    color: Colors.red,
                  ),
                  Text(
                    'What can you do?',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                  'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                'Required qualifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: primaryColor,
                  ),
                  Text(
                    'Intermediate',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Course duration',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.book_online_rounded,
                    color: primaryColor,
                  ),
                  Text(
                    'undefined Topic',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Topic list',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 3,
              children: [
                CourseCardItem(),
                CourseCardItem(),
                CourseCardItem(),
                CourseCardItem(),
                CourseCardItem(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Tutor suggestions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Keegan',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                )),
          ]),
        ),
      ),
    );
  }
}
