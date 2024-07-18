import 'package:drift/drift.dart';

class Questions extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get question => text().withLength(min: 1, max: 512)();
  TextColumn get hint => text().nullable().withLength(min: 1, max: 512)();
  TextColumn get image => text().nullable()();
  TextColumn get answer => text().withLength(min: 1, max: 512).nullable()();
  TextColumn get multichoiceAnswers => text().nullable()();
  IntColumn get multichoiceAnswersCorrectIndex => integer().nullable()();
  IntColumn get type => integer()();
  TextColumn get category => text()();
  TextColumn get author => text()();
  IntColumn get jeopardyWeight => integer()();
}
