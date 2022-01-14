import 'package:get/get.dart';
import 'package:skitour_planning/oneoften/data/questions_repository.dart';

// todo add phase number? It depends do how you prepare BE data: in one or three tables - to avoid redundant mapping.
class QuestionsController extends GetxController {
  // todo simplify question numbers and stack size
  RxInt _currentQuestionNumber = 1.obs;
  RxInt _currentQuestionsStackSize = 5.obs;
  int _maxStackSize = 5;

  // var currentQuestionText =
  //     "...".obs; //QuestionsRepository.phase1[currentQuestionNumber].item1.obs;
  // var currentQuestionAnswer = "...".obs;

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

  String get getQuestionText => repository.phase1[_currentQuestionNumber.value - 1].item1;

  String get getQuestionAnswer => repository.phase1[_currentQuestionNumber.value - 1].item2;
}
