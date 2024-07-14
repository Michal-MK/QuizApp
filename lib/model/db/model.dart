import 'dart:io';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';

part 'model.g.dart';

class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
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

@DriftDatabase(tables: [Questions])
class QuestionDatabase extends _$QuestionDatabase {
  QuestionDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

NativeDatabase _openConnection() {
  String dbFolder = p.dirname(Platform.resolvedExecutable);
  if (Platform.isMacOS) {
    dbFolder = "~/sqlite/";
  }
  Directory(dbFolder).create(recursive: true);
  final file = File(p.join(dbFolder, 'db.sqlite'));
  return NativeDatabase(file);
}

final QuestionDatabase db = QuestionDatabase();
