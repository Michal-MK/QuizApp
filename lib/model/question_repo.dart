import 'package:drift/drift.dart';
import 'package:quiz/model/db/model.dart';

class QuestionRepo {
  final QuizDatabase db;

  QuestionRepo(this.db);

  Future<int> save(Question question) async {
    if (question.id != null) {
      await db.questions.update().replace(
            QuestionsCompanion(
              id: Value(question.id),
              question: Value(question.question),
              hint: Value.absentIfNull(question.hint),
              category: Value(question.category),
              answer: Value.absentIfNull(question.answer),
              type: Value(question.type),
            ),
          );
      return question.id!;
    }

    return db.questions.insertOne(
      QuestionsCompanion.insert(
        question: question.question,
        hint: Value.absentIfNull(question.hint),
        category: question.category,
        answer: Value.absentIfNull(question.answer),
        type: question.type,
        author: question.author,
        jeopardyWeight: question.jeopardyWeight,
      ),
    );
  }
  
  Future<int> saveAndAddToQuiz(Question question, int quizId) async {
    int qId = await save(question);
    await db.quizQuestions.insertOne(
      QuizQuestionsCompanion.insert(
        quizId: quizId,
        questionId: qId,
      ),
    );
    return qId;
  }

  Future<void> linkToQuiz(int quizId, int questionId) async {
    await db.quizQuestions.insertOne(
      QuizQuestionsCompanion.insert(
        quizId: quizId,
        questionId: questionId,
      ),
    );
  }

  Future<void> unlinkFromQuiz(int quizId, int questionId) async {
    await db.quizQuestions.deleteWhere(
      (tbl) => tbl.quizId.equals(quizId) & tbl.questionId.equals(questionId),
    );
  }

  Future<List<Question>> getQuestions() {
    return db.questions.select().get();
  }

  Future<void> delete(int id) {
    return db.questions.deleteWhere((tbl) => tbl.id.equals(id));
  }
}
