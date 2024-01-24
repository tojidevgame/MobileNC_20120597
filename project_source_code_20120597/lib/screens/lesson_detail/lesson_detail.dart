import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/widgets/lession_detail/topic_lesson.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<StatefulWidget> createState() => LessonDetailState();
}

class LessonDetailState extends State<LessonDetail> {
  String remotePDFpath = "";

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('assets/course/course_avatar.png'),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: const Text(
                  'Life in the Internet Age',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Container(
                child: const Text(
                    'Let\'s discuss how technology is changing the way we live',
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: const Text(
                  'Topic list',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Container(
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopicItem(title: 'The Internet', linkPdf: 'http://www.pdf995.com/samples/pdf.pdf'),
                      TopicItem(
                          title: 'Artificial Intelligence (AI)', linkPdf: ''),
                      TopicItem(title: 'Social Media', linkPdf: ''),
                      TopicItem(title: 'Internet Privacy', linkPdf: ''),
                      TopicItem(title: 'Live Streaming', linkPdf: ''),
                      TopicItem(title: 'Coding', linkPdf: ''),
                      TopicItem(
                          title: 'Technology Transforming Healthcare',
                          linkPdf: ''),
                      TopicItem(title: 'Smart Home Technology', linkPdf: ''),
                      TopicItem(
                          title: 'Remote Work - A Dream Job?', linkPdf: ''),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


