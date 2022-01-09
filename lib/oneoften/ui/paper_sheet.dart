import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/presentation/questions_controller.dart';
import 'package:tuple/tuple.dart';

import '../../theme_colors.dart';

// todo every PaperSheet keeps QuestionsController :( Looks non optimal.
class PaperSheet extends GetView<QuestionsController> {
  static final Random _random = new Random(); // todo DI

  static const HEIGHT = 450.0;
  static const WIDTH = 250.0;

  PaperSheet({
    required this.questionNumber,
    Key? key,
  }) : super(key: key);

  final questionNumber;
  var _params;

  @override
  Widget build(BuildContext context) {
    _params = [
      Tuple3<Color, Color, double>(ThemeColors.burntSienna, Colors.white, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.charcoal, Colors.white, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.orangeYellowCrayola, Colors.black, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.persianGreen, Colors.black, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.sandyBrown, Colors.white, _nextRotationZ()),
    ];

    return Container(
      transform: Matrix4.rotationZ(assignedRotationZ(questionNumber)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Material(
          child: Container(
            width: WIDTH,
            height: HEIGHT,
            color: assignedBackgroundColor(questionNumber),
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
                          color: assignedTextColor(questionNumber),
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
                          color: assignedTextColor(questionNumber),
                        ),
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

  /// returns value in radians
  double _nextRotationZ() {
    return _random.nextDouble() / 10 * ((_random.nextBool()) ? 1 : -1);
  }

  Color assignedBackgroundColor(int questionNumber) {
    return _params[questionNumber % _params.length].item1;
  }

  Color assignedTextColor(int questionNumber) {
    return _params[questionNumber % _params.length].item2;
  }

  double assignedRotationZ(int questionNumber) {
    return _params[questionNumber % _params.length].item3;
  }
}
