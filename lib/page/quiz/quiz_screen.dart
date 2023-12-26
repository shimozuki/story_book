// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_book/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  final int? id_cerita;
  const QuizScreen({Key? key, this.id_cerita}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionController _controller = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _controller.fetchDataFromApi(widget.id_cerita),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Body();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading data"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
