import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/const_var.dart';
import 'package:lettutor_mobile_toji/providers/tutor_profile_provider.dart';
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
              // getFavouriteIcon(tutorProfileProvider.tutor.isFavourite,
              //     () => tutorProfileProvider.favoriteTutor()),
              getFavouriteIcon(false,
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
          Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    _showPopup(context);
                  },
                  child: const Icon(
                    Icons.report_outlined,
                    color: primaryColor,
                    size: 36.0,
                  )),
              const Text(
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

void _showPopup(BuildContext context) {
  var textFieldController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Report this tutor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'What problem are you facing?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'This tutor bothers me',
                style: TextStyle(fontSize: 12),
              ),
              value: false,
              onChanged: (bool? value) {
                // Handle checkbox state change
                textFieldController.text += 'This tutor bothers me\n';
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'This profile is fake',
                style: TextStyle(fontSize: 12),
              ),
              value: false,
              onChanged: (bool? value) {
                // Handle checkbox state change
                textFieldController.text += 'This profile is fake\n';
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Inappropriate profile photo',
                style: TextStyle(fontSize: 12),
              ),
              value: false,
              onChanged: (bool? value) {
                // Handle checkbox state change
                textFieldController.text += 'Inappropriate profile photo\n';
              },
            ),
            TextField(
              maxLines: 3,
              style: const TextStyle(fontSize: 12),
              controller: textFieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter additional details...',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle send button press
              Navigator.pop(context);
            },
            child: Text('Send'),
          ),
        ],
      );
    },
  );
}


