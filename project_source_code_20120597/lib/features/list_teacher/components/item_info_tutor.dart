// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/components/card_english_type.dart';
import 'package:lettutor_mobile_toji/features/tutor_profile/screens/tutor_profile.dart';

class GeneralInfoTutor extends StatefulWidget {
  final Tutor tutor;

  const GeneralInfoTutor({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return GeneralInfoTutorState();
  }
}

class GeneralInfoTutorState extends State<GeneralInfoTutor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(widget.tutor.avatar),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  widget.tutor.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CountryFlag.fromCountryCode(widget.tutor.countryCode,),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(widget.tutor.countryCode))
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(5, (index) {
                                        return GestureDetector(
                                          child: Icon(
                                            Icons.star,
                                            size: 30,
                                            color: index < widget.tutor.rate.round()
                                                ? Colors.amber
                                                : const Color.fromARGB(
                                                    255, 78, 78, 78),
                                          ),
                                        );
                                      }))),
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: widget.tutor.specialized
                                      .map((e) => CardEnglishType(
                                            englishType: e,
                                            onPressed: () {},
                                          ))
                                      .toList(),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text(
                                    'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events.',
                                    textAlign: TextAlign.center,
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  child: Container(
                                    width: 120,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            primaryColor, // Color of the border
                                        width: 1.5, // Width of the border
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          16), // Border radius for rounded corners
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TutorProfile(),
                                          ),
                                        );
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.calendar_month,
                                            size: 25,
                                            color: primaryColor,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 0, 0, 0),
                                            child: Text(
                                              'Đặt lịch',
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          )), // Avatar
                      const Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Icon(
                                Icons.favorite_border,
                                color: primaryColor,
                              ))), // Heart
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
              ],
            ),
          ),
        ));
  }
}
