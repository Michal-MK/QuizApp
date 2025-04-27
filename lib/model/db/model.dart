import 'dart:io';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:quiz/model/db/tables/question.dart';
import 'package:quiz/model/db/tables/quiz.dart';
import 'package:quiz/model/db/tables/quiz_question.dart';

part 'model.g.dart';

@DriftDatabase(tables: [
  Questions,
  Quizes,
  QuizQuestions,
])
class QuizDatabase extends _$QuizDatabase {
  QuizDatabase() : super(_openConnection());

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