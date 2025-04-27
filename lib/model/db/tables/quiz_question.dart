import 'package:drift/drift.dart';

class QuizQuestions extends Table {
  IntColumn get quizId => integer()();
  IntColumn get questionId => integer()();

  @override
  Set<Column> get primaryKey => {quizId, questionId};
}
