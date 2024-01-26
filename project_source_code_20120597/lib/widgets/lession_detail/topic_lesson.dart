// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile_toji/screens/lesson_detail/lesson_pdf_screen.dart';

class TopicItem extends StatefulWidget {
  final String linkPdf;
  final String title;
  const TopicItem({
    Key? key,
    required this.linkPdf,
    required this.title,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => TopicItemState();
}

class TopicItemState extends State<TopicItem> {
  String remotePDFpath = "";

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      final filename = widget.linkPdf.substring(widget.linkPdf.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(widget.linkPdf));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () {
            createFileOfPdfUrl().then((f) {
              setState(() {
                remotePDFpath = f.path;
              });

              if (remotePDFpath.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(path: remotePDFpath),
                  ),
                );
              }
            });
          },
          child: Text('1. ${widget.title}')),
    );
  }
}
