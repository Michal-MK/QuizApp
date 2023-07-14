import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question.dart';

class QuestionManagementVM extends ChangeNotifier {
  List<Question> questions = [];

  void loadQuestions() async {
    questions = await QuestionEx.getQuestions();
    notifyListeners();
  }

  void deleteQuestion(int id) async {
    await db.delete(db.questions)..where((entity) => entity.id.equals(id))..go();
    loadQuestions();
  }

  void editQuestion(int id) {

  }
}