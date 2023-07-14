import 'package:drift/drift.dart';
import 'package:quiz/model/db/model.dart';

extension QuestionEx on Question {
  Future save() async {
    db.into(db.questions).insert(
          QuestionsCompanion.insert(
            question: question,
            hint: Value.ofNullable(hint),
            category: category,
            answer: Value.ofNullable(answer),
            type: type,
            author: author,
            jeopardyWeight: jeopardyWeight,
          ),
        );
  }

  static Future<List<Question>> getQuestions() async {
    return db.select(db.questions).get();
  }
}
