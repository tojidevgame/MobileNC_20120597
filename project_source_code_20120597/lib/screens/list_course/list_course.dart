import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/shared/components/ComboboxMultichoice.dart';
import 'package:lettutor_mobile_toji/widgets/list_course/course_item.dart';

class ListCourse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListCourseState();
}

class ListCourseState extends State<ListCourse>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double x = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/course/course.png'),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore courses',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintText: 'Course',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: const Text(
                      'LiveTutor has built the most quality, methodical and scientific courses in life fields for those who want to improve their knowledge in these fields.'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ComboboxMultichoice(
                      hint: 'Level',
                      selectedList: (List<String> listString){},
                      listOfStrings: ['Haha', 'haha1'],
                      onSelectionChanged: (listString) {}),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ComboboxMultichoice(
                      hint: 'Category',
                      selectedList: (List<String> listString){},
                      listOfStrings: ['Haha', 'haha1'],
                      onSelectionChanged: (listString) {}),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ComboboxMultichoice(
                      hint: 'Sort by difficulty',
                      selectedList: (List<String> listString){},
                      listOfStrings: ['Haha', 'haha1'],
                      onSelectionChanged: (listString) {}),
                )
              ],
            ),
          ),
          Container(
              child: DefaultTabController(
            length: 3,
            child: TabBar(controller: _tabController, tabs: const [
              Tab(text: 'Courses'),
              Tab(text: 'E-books'),
              Tab(text: 'Interactive E-book'),
            ]),
          )),
          Container(
            height: 400 * x,
            child: TabBarView(
              controller: _tabController,
              children: [
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text(
                        'English For Traveling',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    Container(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [CourseItem(), CourseItem()],
                      ),
                    )
                  ],
                ),
                Container(
                  child: Text('Tab1'),
                ),
                Container(
                  child: Text('Tab1'),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
