import 'package:drift/drift.dart';
import 'package:quiz/model/db/model.dart';

class QuestionRepo {
  final QuestionDatabase db;

  QuestionRepo(this.db);

  Future save(Question question) async {
    if(question.id != null) {
      return db.questions.update().replace(
        QuestionsCompanion(
          id: Value(question.id),
          question: Value(question.question),
          hint: Value.ofNullable(question.hint),
          category: Value(question.category),
          answer: Value.ofNullable(question.answer),
          type: Value(question.type),
        ),
      );
    }
          
    return db.questions.insertOne(
      QuestionsCompanion.insert(
        question: question.question,
        hint: Value.ofNullable(question.hint),
        category: question.category,
        answer: Value.ofNullable(question.answer),
        type: question.type,
        author: question.author,
        jeopardyWeight: question.jeopardyWeight,
      ),
    );
  }

  Future<List<Question>> getQuestions() {
    return db.questions.select().get();
  }

  delete(int id) {
    return db.questions.deleteWhere((tbl) => tbl.id.equals(id));
  }
}
