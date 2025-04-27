import 'package:flutter/foundation.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/quiz_repo.dart';

class HomeVM extends ChangeNotifier {
  final QuizRepo quizRepo;

  List<Quiz>? quizes;

  HomeVM(this.quizRepo);

  Future<void> init() async {
    quizes = await quizRepo.getQuizes();
    notifyListeners();
  }
}
