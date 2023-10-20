import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TutorScreenState();
  }
}

class TutorScreenState extends State<TutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                color: primaryColor,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'The lesson is about to take place',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The total number of hours you have studied is 507 hours and 30 minutes',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Find a tutor'),
                    const TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: primaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              gapPadding: 0.5),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              gapPadding: 1),
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          hintText: 'Enter tutor name...',
                        )),
                    DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Cac', child: Text('Cac')),
                        DropdownMenuItem(value: 'Hehe', child: Text('Hehe')),
                        DropdownMenuItem(value: 'Hihi', child: Text('Hehe')),
                        DropdownMenuItem(value: 'Haha', child: Text('Hehe')),
                      ],
                      onChanged: (value) {},
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
