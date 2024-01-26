import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/models/tutor_detail_info_model.dart';
import 'package:lettutor_mobile_toji/widgets/list_teacher/card_english_type.dart';

// ignore: must_be_immutable
class TutorSpecialInfo extends StatefulWidget {
  final TutorDetailInfo tutor;

  const TutorSpecialInfo({super.key, required this.tutor});
  @override
  State<StatefulWidget> createState() => TutorSpecialInfoState();
}

class TutorSpecialInfoState extends State<TutorSpecialInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Học vấn',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(widget.tutor.education!),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Ngôn ngữ',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(widget.tutor.languages!),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Chuyên ngành',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: widget.tutor.specialties
                  .map((e) => CardEnglishType(
                        englishType: e,
                        onPressed: () {},
                      ))
                  .toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Sở thích',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.tutor.interests!,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Kinh nghiệm giảng dạy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.tutor.experience!,
            ),
          ),
        ],
      ),
    );
  }
}
