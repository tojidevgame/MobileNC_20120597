import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/features/history/screens/history.dart';
import 'package:lettutor_mobile_toji/features/list_course/screens/list_course.dart';
import 'package:lettutor_mobile_toji/features/schedule_set/screens/screen_schedule_set.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Schedule'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleSet(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('History'),
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang History khi chọn mục này
              // Thêm xử lý khi chọn mục History
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Courses'),
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang Courses khi chọn mục này
              // Thêm xử lý khi chọn mục Courses
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCourse(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('My Courses'),
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang My Courses khi chọn mục này
              // Thêm xử lý khi chọn mục My Courses
            },
          ),
        ],
      ),
    );
  }
}
