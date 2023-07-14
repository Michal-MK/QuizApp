import 'package:drift/drift.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/db/question_type.dart';

class AddQuestionVM extends ChangeNotifier {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController hintController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  final TextEditingController jeopardyWeightController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  int selectedQuestionType = 0;

  final TextEditingController textAnswerController = TextEditingController();
  final TextEditingController numberAnswerController = TextEditingController();
  bool boolQuestionAnswer = false;
  final TextEditingController geolocationAnswerController = TextEditingController();

  void boolQuestionAnswerChanged(bool value) {
    boolQuestionAnswer = value;
    notifyListeners();
  }

  get questionTypesList => questionTypes
      .map(
        (e) => ComboBoxItem(value: e.id.value, child: Text(e.name)),
      )
      .toList();

  Future saveQuestion() async {
    final String question = questionController.text;
    String? hint = hintController.text;
    final String category = categoryController.text;
    final String author = authorController.text;
    final String jeopardyWeight = jeopardyWeightController.text;

    if (hint.isEmpty) {
      hint = null;
    }

    if (question.isEmpty || author.isEmpty || jeopardyWeight.isEmpty || category.isEmpty) {
      return;
    } else {
      var answer = saveAnswer(selectedQuestionType, textAnswerController.text, boolQuestionAnswer, numberAnswerController.text, geolocationAnswerController.text);
      if (answer.value == null || answer.value!.isEmpty) {
        return;
      }

      await db.into(db.questions).insert(
            QuestionsCompanion.insert(
              question: question,
              hint: hint == null ? const Value.absent() : Value.ofNullable(hint),
              answer: answer,
              type: selectedQuestionType,
              author: author,
              category: category,
              jeopardyWeight: int.parse(jeopardyWeight),
            ),
          );
    }
  }

  void questionTypeChanged(int? value) {
    if (value == null) return;
    selectedQuestionType = value;
    notifyListeners();
  }

  Value<String?> saveAnswer(int selectedQuestionType, String textAns, bool boolAns, String numberAns, String locationAns) {
    switch (selectedQuestionType) {
      case 0:
        return Value(textAns);
      case 1:
        return Value(numberAns);
      case 3:
        return Value(boolAns ? 'true' : 'false');
      case 4:
        return Value(locationAns);
      default:
        return Value(textAns);
    }
  }
}
