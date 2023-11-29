import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/commons/const_var.dart';
import 'package:lettutor_mobile_toji/commons/models/tutor_model.dart';

class TutorMainInfo extends StatefulWidget {
  final Tutor tutor;

  const TutorMainInfo({super.key, required this.tutor});
  @override
  State<StatefulWidget> createState() {
    return TutorMainInfoState();
  }
}

class TutorMainInfoState extends State<TutorMainInfo> {
  bool isViewMore = false;
  String txtShortIntroduce = '';

  @override
  void initState() {
    super.initState();

    txtShortIntroduce = widget.tutor.introduce;
    if (txtShortIntroduce.length > 100) {
      txtShortIntroduce = txtShortIntroduce.substring(0, 100);
      txtShortIntroduce += '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.tutor.avatar),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.tutor.name),
                    Row(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                child: Icon(
                                  Icons.star,
                                  size: 30,
                                  color: index < widget.tutor.rate
                                      ? Colors.amber
                                      : const Color.fromARGB(255, 78, 78, 78),
                                ),
                              );
                            })),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(widget.tutor.numberRate.toString()),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CountryFlag.fromCountryCode(
                                widget.tutor.countryCode),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(widget.tutor.countryCode))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(isViewMore ? widget.tutor.introduce : txtShortIntroduce),
                TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(0), // Padding for the button
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      isViewMore = !isViewMore;
                      setState(() {
                        if (isViewMore) {
                          txtShortIntroduce = widget.tutor.introduce;
                        } else {
                          txtShortIntroduce = widget.tutor.introduce;
                          if (txtShortIntroduce.length > 100) {
                            txtShortIntroduce =
                                txtShortIntroduce.substring(0, 100);
                            txtShortIntroduce += '...';
                          }
                        }
                      });
                    },
                    child: Text(isViewMore ? 'Show less' : 'Show more', style: const TextStyle(color: primaryColor),))
              ])
        ],
      ),
    );
  }
}
