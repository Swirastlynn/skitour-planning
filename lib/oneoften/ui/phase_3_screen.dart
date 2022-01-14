import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/general/logger.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:skitour_planning/oneoften/ui/PaperSheetParams.dart';
import 'package:skitour_planning/oneoften/ui/paper_sheet.dart';

class Phase3Screen extends StatelessWidget {
  static const ROUTE = '/oneoften/phase3';

  final QuestionsController controller = Get.put(QuestionsController());
  final params = PaperSheetParams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Question number: ${controller.getQuestionNumber}'),
                    ),
                  );
                },
                onAccept: (int draggableData) {
                  debugPrint('draggable onAccept');
                  controller.nextQuestion();
                },
                onWillAccept: (item) {
                  debugPrint('draggable is on the target $item');
                  return true;
                },
                onLeave: (item) {
                  debugPrint('draggable has left the target $item');
                },
              ),
              Center(
                child: Obx(
                  () {
                    return Stack(
                      children: _getDraggablePaperSheets(controller.getQuestionsStackSize),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getDraggablePaperSheets(int currentQuestionsStackSize) {
    List<Widget> sheets = [];
    int i = 0;
    logger.d("currentQuestionsStackSize = $currentQuestionsStackSize");
    for (i = 1; i < currentQuestionsStackSize; i++) {
      sheets.add(
        Draggable(
          maxSimultaneousDrags: 1,
          data: i,
          child: PaperSheet(questionNumber: i, params: params),
          feedback: PaperSheet(questionNumber: i, params: params),
        ),
      );
    }
    return sheets;
  }
}
