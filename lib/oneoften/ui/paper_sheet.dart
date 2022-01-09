import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:skitour_planning/oneoften/ui/PaperSheetParams.dart';

// todo every PaperSheet keeps QuestionsController :( Looks non optimal.
class PaperSheet extends GetView<QuestionsController> {
  static const HEIGHT = 450.0;
  static const WIDTH = 250.0;

  PaperSheet({
    required this.questionNumber,
    required this.params,
    Key? key,
  }) : super(key: key);

  final int questionNumber;
  final PaperSheetParams params;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(params.assignedRotationZ(questionNumber)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Material(
          child: Container(
            width: WIDTH,
            height: HEIGHT,
            color: params.assignedBackgroundColor(questionNumber),
            child: Column(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  alignment: Alignment.topCenter,
                  child: Obx(
                    () {
                      return Text(
                        'Question ${controller.getQuestionNumber}: ${controller.getQuestionText}',
                        style: TextStyle(
                          color: params.assignedTextColor(questionNumber),
                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  alignment: Alignment.topCenter,
                  child: Obx(() {
                    return Text(
                      'Answer: ${controller.getQuestionAnswer}',
                      style: TextStyle(
                        color: params.assignedTextColor(questionNumber),
                        fontSize: 16,
                      ),
                    );
                  }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
