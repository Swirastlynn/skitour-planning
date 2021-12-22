import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/data/questions_repository.dart';

// todo rename, cause different Phases may have one controller
class Phase1Controller extends GetxController {
  var currentQuestionNumber = 1.obs;
  var currentQuestionText = "Pytanie".obs;//QuestionsRepository.phase1[currentQuestionNumber].item1.obs;
  var currentQuestionAnswer = "Tyle i tyle".obs;

  final repository = QuestionsRepository();

  increment() => currentQuestionNumber++;

  decrement() {
    if (currentQuestionNumber > 0) {
      currentQuestionNumber--;
    }
  }

}