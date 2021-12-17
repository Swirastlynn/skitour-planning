import 'package:get/get.dart';

class Phase1Controller extends GetxController {
  var currentQuestionNumber = 1.obs;

  var currentQuestionText = "".obs;

  increment() => currentQuestionNumber++;

  decrement() {
    if (currentQuestionNumber > 0) {
      currentQuestionNumber--;
    }
  }


}
