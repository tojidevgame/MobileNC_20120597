import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/screens/history/history.dart';
import 'package:lettutor_mobile_toji/screens/list_course/list_course.dart';
import 'package:lettutor_mobile_toji/screens/profile/profile_screen.dart';
import 'package:lettutor_mobile_toji/screens/schedule_set/screen_schedule_set.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang Home khi chọn mục này
              // Thêm xử lý khi chọn mục Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/common/img_user.png'), // Thay đổi đường dẫn đến ảnh avatar của bạn
                    radius: 35,
                  ),
                  Text(
                    'Nguyen Van A',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ),
          ListTile(
            title: const Text('Schedule'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScheduleSet(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('History'),
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
            title: const Text('Courses'),
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
            title: const Text('My Courses'),
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
