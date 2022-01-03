import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/data/questions_repository.dart';
import 'package:tuple/tuple.dart';

import '../../theme_colors.dart';

class QuestionsController extends GetxController {
  static final Random _random = new Random(); // todo DI

  var _params;

  @override
  void onInit() {
    super.onInit();
    _params = [
      Tuple3<Color, Color, double>(ThemeColors.burntSienna, Colors.white, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.charcoal, Colors.white, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.orangeYellowCrayola, Colors.black, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.persianGreen, Colors.black, _nextRotationZ()),
      Tuple3<Color, Color, double>(ThemeColors.sandyBrown, Colors.white, _nextRotationZ()),
    ];
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

  // todo simplify question numbers and stack size
  RxInt _currentQuestionNumber = 1.obs;
  RxInt _currentQuestionsStackSize = 5.obs;
  int _maxStackSize = 5;

  var currentQuestionText =
      "...".obs; //QuestionsRepository.phase1[currentQuestionNumber].item1.obs;
  var currentQuestionAnswer = "...".obs;

  final repository = QuestionsRepository();

  nextQuestion() {
    // logger.d("question: $currentQuestionNumber, currentQuestionsStackSize: $currentQuestionsStackSize");
    if (_currentQuestionsStackSize > 0) {
      if (_currentQuestionNumber < _maxStackSize) {
        _currentQuestionNumber++;
      }
      _currentQuestionsStackSize--;
    }
  }

  previousQuestion() {
    if (_currentQuestionNumber > 0) {
      _currentQuestionNumber--;
      _currentQuestionsStackSize++;
    }
  }

  int get getQuestionNumber => _currentQuestionNumber.value;

  int get getQuestionsStackSize => _currentQuestionsStackSize.value;
}
