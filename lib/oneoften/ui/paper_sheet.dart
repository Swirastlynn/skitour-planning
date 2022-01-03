import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';

// todo every PaperSheet keeps QuestionsController :( Looks non optimal.
class PaperSheet extends GetView<QuestionsController> {
  PaperSheet({
    required this.questionNumber,
    Key? key,
  }) : super(key: key);

  final questionNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(controller.assignedRotationZ(questionNumber)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Container(
          width: 250,
          height: 420,
          color: controller.assignedBackgroundColor(questionNumber),
          child: Column(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Obx(
                  () {
                    return Text(
                      'Question: ${controller.currentQuestionText}',
                      style: TextStyle(
                        color: controller.assignedTextColor(questionNumber),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() {
                  return Center(
                    child: Text(
                      'Answer: ${controller.currentQuestionAnswer}',
                      style: TextStyle(
                        color: controller.assignedTextColor(questionNumber),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
