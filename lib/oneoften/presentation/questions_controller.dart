import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/data/questions_repository.dart';

class QuestionsController extends GetxController {
  // todo simplify question numbers and stack size
  RxInt _currentQuestionNumber = 1.obs;
  RxInt _currentQuestionsStackSize = 3.obs;
  int _maxStackSize = 3;

  var currentQuestionText =
      "Pytanie".obs; //QuestionsRepository.phase1[currentQuestionNumber].item1.obs;
  var currentQuestionAnswer = "Tyle i tyle".obs;

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

  RxInt getQuestionNumber() => _currentQuestionNumber;

  RxInt getQuestionsStackSize() => _currentQuestionsStackSize;
}
