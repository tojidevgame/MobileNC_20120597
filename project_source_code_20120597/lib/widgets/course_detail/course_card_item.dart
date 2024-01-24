import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/screens/lesson_detail/lesson_detail.dart';

class CourseCardItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseCardItemState();
}

class CourseCardItemState extends State<CourseCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
          ),
          onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LessonDetail(),
              ),
            );},
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle:
                      Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
              ],
            ),
          ),
        ));
  }
}
