import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question_repo.dart';

class QuestionManagementVM extends ChangeNotifier {
  final QuestionRepo db;
  
  List<Question> questions = [];

  QuestionManagementVM(this.db) {
    loadQuestions();
  }

  void loadQuestions() async {
    questions = await db.getQuestions();
    notifyListeners();
  }

  void deleteQuestion(int id) async {
    await db.delete(id);
    loadQuestions();
  }

  void editQuestion(int id) {}
}
