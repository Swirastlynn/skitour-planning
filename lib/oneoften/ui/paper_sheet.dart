import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/phase_1_controller.dart';

class PaperSheet extends StatelessWidget {
  const PaperSheet({
    Key? key,
    required this.controller,
    required this.color,
    required this.rotationZ,
  }) : super(key: key);

  final Phase1Controller controller;
  final Color color;
  final double rotationZ;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(rotationZ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Container(
          color: color,
          child: Column(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Obx(
                  () {
                    return Text('${controller.currentQuestionText}');
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Obx(() {
                  return Center(
                    child: Text('Odpowiedź: ${controller.currentQuestionAnswer}'),
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
