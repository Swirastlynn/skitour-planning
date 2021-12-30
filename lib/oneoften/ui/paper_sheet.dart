import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:skitour_planning/theme_colors.dart';
import 'package:tuple/tuple.dart';

class PaperSheet extends StatelessWidget {
  PaperSheet({
    Key? key,
  }) : super(key: key);

  // TODO controller should be probably moved up, or used in a different way,
  //  to separate abstraction from the PaperSheet
  final QuestionsController controller = Get.find();
  final Random _random = new Random();

  final _colors = [
    Tuple2(ThemeColors.burntSienna, Colors.white),
    Tuple2(ThemeColors.charcoal, Colors.white),
    Tuple2(ThemeColors.orangeYellowCrayola, Colors.black),
    Tuple2(ThemeColors.persianGreen, Colors.black),
    Tuple2(ThemeColors.sandyBrown, Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    var chosenColors = nextRandomColorSet();

    return Container(
      transform: Matrix4.rotationZ(nextRotationZ()),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Container(
          color: chosenColors.item1,
          child: Column(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Obx(
                  () {
                    return Text(
                      '${controller.currentQuestionText}',
                      style: TextStyle(
                        color: chosenColors.item2,
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
                      'Odpowiedź: ${controller.currentQuestionAnswer}',
                      style: TextStyle(
                        color: chosenColors.item2,
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

  /// returns value in radians
  double nextRotationZ() {
    return _random.nextDouble() / 10 * ((_random.nextBool()) ? 1 : -1);
  }

  Tuple2 nextRandomColorSet() {
    return _colors[_random.nextInt(_colors.length)];
  }
}
