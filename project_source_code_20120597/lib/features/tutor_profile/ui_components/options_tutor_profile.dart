import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/provider/tutor_profile_provider.dart';
import 'package:provider/provider.dart';

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
    var tutorProfileProvider = Provider.of<TutorProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // Các widget sẽ căn chỉnh cách đều nhau
        children: <Widget>[
          Column(
            children: <Widget>[
              getFavouriteIcon(tutorProfileProvider.tutor.isFavourite,
                  () => tutorProfileProvider.favoriteTutor()),
              const Text(
                'Favourite',
                style: TextStyle(
                  color: primaryColor, // Màu văn bản xanh
                ),
              ),
            ],
          ),
          const Column(
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
          const Column(
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

Widget getFavouriteIcon(bool isFavourite, VoidCallback onPressed) {
  if (isFavourite) {
    return TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          foregroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        onPressed: onPressed,
        child: const Icon(
          Icons.favorite_outline,
          color: primaryColor, // Màu biểu tượng xanh
          size: 36.0,
        ));
  } else {
    return TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          foregroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        onPressed: onPressed,
        child: const Icon(
          Icons.favorite,
          color: Colors.red, // Màu biểu tượng xanh
          size: 36.0,
        ));
  }
}
