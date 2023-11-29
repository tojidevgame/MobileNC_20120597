import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/components/appbar.dart';
import 'package:lettutor_mobile_toji/commons/components/sidebar.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/components/card_english_type.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/components/item_info_tutor.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/provider/list_tutor_provider.dart';
import 'package:provider/provider.dart';

class TutorScreen extends StatefulWidget {
  const TutorScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TutorScreenState();
  }
}

class TutorScreenState extends State<TutorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
  void initState() {
    super.initState();
  }

  void filterTutorWithSpecialities(List<String> specialities) {
    if(specialities.contains('Tất cả')) specialities.clear();
    // call to ListTutorProvider
    var listTutorProvider =
        Provider.of<ListTutorProvider>(context, listen: false);
    listTutorProvider.filterTutorWithSpecialities(specialities);
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var listTutorProvider = Provider.of<ListTutorProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(),
        appBar: CustomAppBar(
          onHamburgerTap: _openDrawer,
        ),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                    value: '1',
                                    child: Text('Gia Sư Nước Ngoài')),
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
                                      onPressed: () {
                                        filterTutorWithSpecialities([e]);
                                      },
                                    ))
                                .toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                              onPressed: () {  },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: primaryColor, width: 1)),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              child: const Text("Đặt lại bộ tìm kiếm", style: TextStyle(color: primaryColor),),
                              ),
                        ),
                        const Text(
                          'Recommended tutors',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: Column(
                            children: listTutorProvider.tutors
                                .map((e) => GeneralInfoTutor(tutor: e))
                                .toList(),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

filterTutorWithSpecialities() {}
