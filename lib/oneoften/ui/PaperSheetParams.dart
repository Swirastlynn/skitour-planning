import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../theme_colors.dart';

class PaperSheetParams {
  // todo DI
  static final Random _random = new Random();

  var _params;

  PaperSheetParams(): _params = [
    Tuple3<Color, Color, double>(
        ThemeColors.burntSienna, Colors.white, _nextRotationZ()),
    Tuple3<Color, Color, double>(
        ThemeColors.charcoal, Colors.white, _nextRotationZ()),
    Tuple3<Color, Color, double>(
        ThemeColors.orangeYellowCrayola, Colors.black, _nextRotationZ()),
    Tuple3<Color, Color, double>(
        ThemeColors.persianGreen, Colors.black, _nextRotationZ()),
    Tuple3<Color, Color, double>(
        ThemeColors.sandyBrown, Colors.white, _nextRotationZ()),
  ];

  /// returns value in radians
  static double _nextRotationZ() {
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