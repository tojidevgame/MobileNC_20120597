

import 'package:flutter/material.dart';

class CardEnglishType extends StatefulWidget {
  final String englishType;
  final VoidCallback onPressed;

  const CardEnglishType(
      {super.key, required this.englishType, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return CardEnglishTypeState(text: englishType, onPressed: onPressed);
  }
}

class CardEnglishTypeState extends State<CardEnglishType> {
  final String text;
  final VoidCallback onPressed;

  CardEnglishTypeState({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.fromLTRB(8, 1, 8, 1), // Padding for the button
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 228, 230, 235)), // Màu nền
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )),
    );
  }
}