import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:skitour_planning/oneoften/ui/paper_sheet.dart';

class Phase2Screen extends StatefulWidget {
  static const ROUTE = '/oneoften/phase2';

  @override
  State<Phase2Screen> createState() => _Phase2ScreenState();
}

class _Phase2ScreenState extends State<Phase2Screen> {
  final QuestionsController controller = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
          color: Colors.white,
          child: Stack(
            children: [
              // todo questionNumber should depend on a list of questions from controller
              PaperSheet(questionNumber: 1),
              PaperSheet(questionNumber: 2),
              PaperSheet(questionNumber: 3),
              PaperSheet(questionNumber: 4),
              PaperSheet(questionNumber: 5),
            ],
          ),
        ),
      ),
    );
  }
}
