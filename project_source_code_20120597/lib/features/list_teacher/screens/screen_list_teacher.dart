import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/components/ComboboxMultichoice.dart';
import 'package:lettutor_mobile_toji/commons/components/appbar.dart';
import 'package:lettutor_mobile_toji/commons/components/sidebar.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/features/authen/provider/authprovider.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/components/card_english_type.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/components/item_info_tutor.dart';
import 'package:lettutor_mobile_toji/features/list_teacher/provider/list_tutor_provider.dart';
import 'package:lettutor_mobile_toji/services/tutor_service.dart';
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

  String? token;
  int page = 1;
  int perPage = 10;
  bool isLoadMore = false;
  late ScrollController _scrollController;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController()..addListener(loadMore());
  }

  void filterTutorWithSpecialities(List<String> specialities) {
    if (specialities.contains('Tất cả')) specialities.clear();
    // call to ListTutorProvider
    var listTutorProvider =
        Provider.of<ListTutorProvider>(context, listen: false);
    listTutorProvider.filterTutorWithSpecialities(specialities);
  }

  // function filter tutor with name
  void filterTutorWithName(String name) {
    // call to ListTutorProvider
    var listTutorProvider =
        Provider.of<ListTutorProvider>(context, listen: false);
    listTutorProvider.filterTutorWithName(name);
  }

  // function filter tutor with country
  void filterTutorWithCountry(List<String> selectionCountry) {
    // filter with this selection 'Gia Sư Nước Ngoài', 'Gia Sư Việt Nam', 'Gia Sư Tiếng Anh Bản Ngữ'
    // call to ListTutorProvider
    var listTutorProvider =
        Provider.of<ListTutorProvider>(context, listen: false);
    listTutorProvider.filterTutorWithCountry(selectionCountry);
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }


  void getListTutorRecommend(String token, ListTutorProvider tutorProvider) async {
    // call to ListTutorProvider
    print("Get list tutor recommend");
    var listTutor = await TutorService.getTutorsWithPagination(page, perPage, token);
    tutorProvider.tutors = listTutor;

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void loadMore() async {
    if (_scrollController.position.extentAfter < page * perPage) {
      setState(() {
        isLoadMore = true;
        page++;
      });

      try {
        // final response = await TutorService.getTutorsWithPagination(page, perPage, token as String, search: search, specialties: [specialist]);
        if (mounted) {
          setState(() {
            // _results.addAll(response);
            isLoadMore = false;
          });
        }
      } catch (e) {
        // showTopSnackBar(context, const CustomSnackBar.error(message: "Cannot load more"),
        //     showOutAnimationDuration: const Duration(milliseconds: 1000),
        //     displayDuration: const Duration(microseconds: 4000));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var listTutorProvider = Provider.of<ListTutorProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);

    if (_isLoading && authProvider.tokens != null) {
      getListTutorRecommend(authProvider.tokens.access.token, listTutorProvider);
    }
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
                  height: 220,
                  child: Container(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'The lesson is about to take place',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'The total number of hours you have studied is 507 hours and 30 minutes',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, right: 25),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Icon(Icons.video_call, color: primaryColor,),
                                    ),
                                    const Text("Come in Class", style: TextStyle(color: primaryColor),)
                                  ],
                                )),
                          )
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
                        TextField(
                            onChanged: (value) {
                              // call to ListTutorProvider
                              filterTutorWithName(value);
                            },
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
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
                          child: ComboboxMultichoice(
                            hint: 'Chọn quốc tịch gia sư',
                            selectedList: (List<String> listString) {},
                            listOfStrings: const [
                              'Gia Sư Nước Ngoài',
                              'Gia Sư Việt Nam',
                              'Gia Sư Tiếng Anh Bản Ngữ'
                            ],
                            onSelectionChanged: (List<String> value) {
                              filterTutorWithCountry(value);
                            },
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
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
                            onPressed: () {},
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      color: primaryColor, width: 1)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Đặt lại bộ tìm kiếm",
                              style: TextStyle(color: primaryColor),
                            ),
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
