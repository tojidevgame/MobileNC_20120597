import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHamburgerTap;

  const CustomAppBar({super.key, required this.onHamburgerTap});
  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: primaryColor), // Màu biểu tượng Hamburger
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onHamburgerTap
        ),
      ],
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'LetTutor',
            style: TextStyle(
              color: primaryColor, // Màu chữ xanh dương
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // CircleAvatar(
          //   backgroundImage: AssetImage(
          //       'assets/common/img_user.png'), // Thay đổi đường dẫn đến ảnh avatar của bạn
          //   radius: 20, // Độ lớn của avatar
          // ),
        ],
      ),
    );
  }
}
