import 'package:drift/drift.dart';
import 'package:quiz/model/db/model.dart';

class QuizRepo {
  final QuizDatabase db;

  QuizRepo(this.db);

  Future<int> save(Quiz quiz) async {
    if (quiz.id != null) {
      await db.quizes.update().replace(
            QuizesCompanion(
              id: Value(quiz.id),
              quizName: Value(quiz.quizName),
              author: Value(quiz.author),
              dateCreated: Value(quiz.dateCreated),
              description: Value.absentIfNull(quiz.description),
              image: Value.absentIfNull(quiz.image),
            ),
          );
      return quiz.id!;
    }

    return db.quizes.insertOne(
      QuizesCompanion.insert(
        quizName: quiz.quizName,
        author: quiz.author,
        dateCreated: quiz.dateCreated,
        description: Value.absentIfNull(quiz.description),
        image: Value.absentIfNull(quiz.image),
      ),
    );
  }

  Future<List<Quiz>> getQuizes() {
    return db.quizes.select().get();
  }

  Future<void> delete(int id) async {
    await db.quizQuestions.deleteWhere((tbl) => tbl.quizId.equals(id));
    await db.quizes.deleteWhere((tbl) => tbl.id.equals(id));
  }

  Future<Quiz?> getById(int quizId) {
    return (db.quizes.select()..where((tbl) => tbl.id.equals(quizId))).getSingleOrNull();
  }

  Future<List<Question>> getLinkedQuestions(int quizId) {
    final quizQuestions = (db.quizQuestions.select()..where((tbl) => tbl.quizId.equals(quizId))).get();
    final questions = quizQuestions.then((value) {
      return (db.questions.select()..where((tbl) => tbl.id.isIn(value.map((e) => e.questionId)))).get();
    });
    return questions;
  }
}
