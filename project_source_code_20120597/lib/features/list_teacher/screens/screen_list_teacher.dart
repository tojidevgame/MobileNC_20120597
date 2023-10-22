import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:country_flags/country_flags.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TutorScreenState();
  }
}

class TutorScreenState extends State<TutorScreen> {
  final List<String> cardEnglishTypeData = [
    'Tất cả',
    'Tiếng Anh cho trẻ em',
    'Giao tiếp',
    'Tiếng Anh cho công việc',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOELF',
    'TOEIC'
  ];

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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        'Find a tutor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: SizedBox(
                        height: 50,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            hintText: 'Chọn quốc tịch gia sư',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gapPadding: 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gapPadding: 1),
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: '1', child: Text('Gia Sư Nước Ngoài')),
                            DropdownMenuItem(
                                value: '2', child: Text('Gia Sư Việt Nam')),
                            DropdownMenuItem(
                                value: '3',
                                child: Text('Gia Sư Tiếng Anh Bản Ngữ')),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: cardEnglishTypeData
                            .map((e) => CardEnglishType(
                                  englishType: e,
                                  onPressed: () {},
                                ))
                            .toList(),
                      ),
                    ),
                    const Text(
                      'Recommended tutors',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(1),
                      child: GeneralInfoTutor(),
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

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
          onPressed: () {},
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

class GeneralInfoTutor extends StatefulWidget {
  const GeneralInfoTutor({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return GeneralInfoTutorState(
        avatar: Image.asset('assets/common/img_user.png'),
        name: 'Not Found',
        rate: 3,
        cardEnglishTypeData: [
          'EnglishToji',
          'English2',
          'English3',
          'English1',
          'English2',
          'English3'
        ]);
  }
}

class GeneralInfoTutorState extends State<GeneralInfoTutor> {
  final Image avatar;
  final String name;
  final int rate;
  final List<String> cardEnglishTypeData;

  GeneralInfoTutorState(
      {required this.avatar,
      required this.name,
      required this.rate,
      required this.cardEnglishTypeData});

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
                                  child: avatar,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  name,
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
                                      child: CountryFlag.fromCountryCode('ES'),
                                    ),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text('ES'))
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
                                            color: index < rate
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
                                  children: cardEnglishTypeData
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
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
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
                                      onPressed: () {},
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
