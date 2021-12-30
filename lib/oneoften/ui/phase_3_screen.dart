import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:skitour_planning/oneoften/ui/paper_sheet.dart';

class Phase3Screen extends StatelessWidget {
  static const ROUTE = '/oneoften/phase3';

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
              DragTarget<int>(
                builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                    ) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.cyan,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Obx(() {
                        return Text('Question number: ${controller.getQuestionNumber}');
                      }),
                    ),
                  );
                },
                onAccept: (int oneCounter) {
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
                      children: _getDraggable(controller.getQuestionsStackSize),
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

  List<Widget> _getDraggable(int currentQuestionsStackSize) {
    List<Widget> listings = [];
    int i = 0;
    for (i = 0; i < currentQuestionsStackSize; i++) {
      listings.add(
        Draggable<int>(
          data: 1, // todo what is it for now?
          // todo PaperSheet data color and rotation has to be kept outside, to be able to use it with childWhenDragging and feedback
          child: PaperSheet(),
          feedback: Container(
            color: Colors.deepOrange,
            height: 300,
            width: 300,
            child: const Icon(Icons.directions_run),
          ),
        ),
      );
    }
    return listings;
  }
}
