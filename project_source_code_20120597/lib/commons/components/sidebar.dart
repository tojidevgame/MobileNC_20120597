import 'package:flutter/material.dart';

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
              // Điều hướng đến trang Schedule khi chọn mục này
              // Thêm xử lý khi chọn mục Schedule
            },
          ),
          ListTile(
            title: Text('History'),
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang History khi chọn mục này
              // Thêm xử lý khi chọn mục History
            },
          ),
          ListTile(
            title: Text('Courses'),
            onTap: () {
              Navigator.pop(context);
              // Điều hướng đến trang Courses khi chọn mục này
              // Thêm xử lý khi chọn mục Courses
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