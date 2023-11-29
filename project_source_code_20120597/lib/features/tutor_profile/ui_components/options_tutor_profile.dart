import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';

class OptionsOnTutorProfile extends StatefulWidget {
  const OptionsOnTutorProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return OptionsOnTutorProfileState();
  }
}

class OptionsOnTutorProfileState extends State<OptionsOnTutorProfile> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // Các widget sẽ căn chỉnh cách đều nhau
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.favorite_outline,
                color: primaryColor, // Màu biểu tượng xanh
                size: 36.0,
              ),
              Text(
                'Favourite',
                style: TextStyle(
                  color: primaryColor, // Màu văn bản xanh
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.star_border_outlined,
                color: primaryColor,
                size: 36.0,
              ),
              Text(
                'Review',
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.report_outlined,
                color: primaryColor,
                size: 36.0,
              ),
              Text(
                'Report',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
