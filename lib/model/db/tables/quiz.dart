import 'package:drift/drift.dart';

@DataClassName("Quiz")
class Quizes extends Table {
  @override
  String get tableName => 'quiz';

  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get quizName => text().withLength(min: 1, max: 512)();
  TextColumn get author => text()();
  IntColumn get dateCreated => integer()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
}
