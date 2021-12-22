import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/data/questions_repository.dart';

class Phase1Controller extends GetxController {
  var currentQuestionNumber = 1.obs;
  var currentQuestionText = "Treść Pytania".obs;
  var currentQuestionAnswer = "Tyle i tyle".obs;

  final repository = QuestionsRepository();

  increment() => currentQuestionNumber++;

  decrement() {
    if (currentQuestionNumber > 0) {
      currentQuestionNumber--;
    }
  }

}
