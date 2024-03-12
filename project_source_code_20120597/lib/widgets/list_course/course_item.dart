import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/screens/course_detail/course_info.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: const Color.fromARGB(255, 83, 83, 83), // Border color
            width: 1.0, // Border width
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseInfo(),
              ),
            );
          },
          child: Column(children: [
            Container(
              height: 250,
              child: Image.asset('assets/course/course_avatar.png'),
            ),
            Container(
              child: const Text(
                'Life is the Internet Age',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: const Text(
                'Let\'s discuss how technology is changing the way we live',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Text('Intermidiate'),
                    padding: EdgeInsets.only(right: 5),
                  ),
                  Icon(
                    Icons.circle,
                    size: 5,
                  ),
                  Container(
                    child: Text('Lessons'),
                    padding: EdgeInsets.only(left: 5),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
