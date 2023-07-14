// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// ignore_for_file: type=lint
class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hintMeta = const VerificationMeta('hint');
  @override
  late final GeneratedColumn<String> hint = GeneratedColumn<String>(
      'hint', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _multichoiceAnswersMeta =
      const VerificationMeta('multichoiceAnswers');
  @override
  late final GeneratedColumn<String> multichoiceAnswers =
      GeneratedColumn<String>('multichoice_answers', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _multichoiceAnswersCorrectIndexMeta =
      const VerificationMeta('multichoiceAnswersCorrectIndex');
  @override
  late final GeneratedColumn<int> multichoiceAnswersCorrectIndex =
      GeneratedColumn<int>(
          'multichoice_answers_correct_index', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jeopardyWeightMeta =
      const VerificationMeta('jeopardyWeight');
  @override
  late final GeneratedColumn<int> jeopardyWeight = GeneratedColumn<int>(
      'jeopardy_weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        question,
        hint,
        image,
        answer,
        multichoiceAnswers,
        multichoiceAnswersCorrectIndex,
        type,
        category,
        author,
        jeopardyWeight
      ];
  @override
  String get aliasedName => _alias ?? 'questions';
  @override
  String get actualTableName => 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('hint')) {
      context.handle(
          _hintMeta, hint.isAcceptableOrUnknown(data['hint']!, _hintMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    }
    if (data.containsKey('multichoice_answers')) {
      context.handle(
          _multichoiceAnswersMeta,
          multichoiceAnswers.isAcceptableOrUnknown(
              data['multichoice_answers']!, _multichoiceAnswersMeta));
    }
    if (data.containsKey('multichoice_answers_correct_index')) {
      context.handle(
          _multichoiceAnswersCorrectIndexMeta,
          multichoiceAnswersCorrectIndex.isAcceptableOrUnknown(
              data['multichoice_answers_correct_index']!,
              _multichoiceAnswersCorrectIndexMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('jeopardy_weight')) {
      context.handle(
          _jeopardyWeightMeta,
          jeopardyWeight.isAcceptableOrUnknown(
              data['jeopardy_weight']!, _jeopardyWeightMeta));
    } else if (isInserting) {
      context.missing(_jeopardyWeightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      hint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hint']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer']),
      multichoiceAnswers: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}multichoice_answers']),
      multichoiceAnswersCorrectIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}multichoice_answers_correct_index']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      jeopardyWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jeopardy_weight'])!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final String question;
  final String? hint;
  final String? image;
  final String? answer;
  final String? multichoiceAnswers;
  final int? multichoiceAnswersCorrectIndex;
  final int type;
  final String category;
  final String author;
  final int jeopardyWeight;
  const Question(
      {required this.id,
      required this.question,
      this.hint,
      this.image,
      this.answer,
      this.multichoiceAnswers,
      this.multichoiceAnswersCorrectIndex,
      required this.type,
      required this.category,
      required this.author,
      required this.jeopardyWeight});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question'] = Variable<String>(question);
    if (!nullToAbsent || hint != null) {
      map['hint'] = Variable<String>(hint);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String>(answer);
    }
    if (!nullToAbsent || multichoiceAnswers != null) {
      map['multichoice_answers'] = Variable<String>(multichoiceAnswers);
    }
    if (!nullToAbsent || multichoiceAnswersCorrectIndex != null) {
      map['multichoice_answers_correct_index'] =
          Variable<int>(multichoiceAnswersCorrectIndex);
    }
    map['type'] = Variable<int>(type);
    map['category'] = Variable<String>(category);
    map['author'] = Variable<String>(author);
    map['jeopardy_weight'] = Variable<int>(jeopardyWeight);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      question: Value(question),
      hint: hint == null && nullToAbsent ? const Value.absent() : Value(hint),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
      multichoiceAnswers: multichoiceAnswers == null && nullToAbsent
          ? const Value.absent()
          : Value(multichoiceAnswers),
      multichoiceAnswersCorrectIndex:
          multichoiceAnswersCorrectIndex == null && nullToAbsent
              ? const Value.absent()
              : Value(multichoiceAnswersCorrectIndex),
      type: Value(type),
      category: Value(category),
      author: Value(author),
      jeopardyWeight: Value(jeopardyWeight),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      hint: serializer.fromJson<String?>(json['hint']),
      image: serializer.fromJson<String?>(json['image']),
      answer: serializer.fromJson<String?>(json['answer']),
      multichoiceAnswers:
          serializer.fromJson<String?>(json['multichoiceAnswers']),
      multichoiceAnswersCorrectIndex:
          serializer.fromJson<int?>(json['multichoiceAnswersCorrectIndex']),
      type: serializer.fromJson<int>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      author: serializer.fromJson<String>(json['author']),
      jeopardyWeight: serializer.fromJson<int>(json['jeopardyWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'question': serializer.toJson<String>(question),
      'hint': serializer.toJson<String?>(hint),
      'image': serializer.toJson<String?>(image),
      'answer': serializer.toJson<String?>(answer),
      'multichoiceAnswers': serializer.toJson<String?>(multichoiceAnswers),
      'multichoiceAnswersCorrectIndex':
          serializer.toJson<int?>(multichoiceAnswersCorrectIndex),
      'type': serializer.toJson<int>(type),
      'category': serializer.toJson<String>(category),
      'author': serializer.toJson<String>(author),
      'jeopardyWeight': serializer.toJson<int>(jeopardyWeight),
    };
  }

  Question copyWith(
          {int? id,
          String? question,
          Value<String?> hint = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> answer = const Value.absent(),
          Value<String?> multichoiceAnswers = const Value.absent(),
          Value<int?> multichoiceAnswersCorrectIndex = const Value.absent(),
          int? type,
          String? category,
          String? author,
          int? jeopardyWeight}) =>
      Question(
        id: id ?? this.id,
        question: question ?? this.question,
        hint: hint.present ? hint.value : this.hint,
        image: image.present ? image.value : this.image,
        answer: answer.present ? answer.value : this.answer,
        multichoiceAnswers: multichoiceAnswers.present
            ? multichoiceAnswers.value
            : this.multichoiceAnswers,
        multichoiceAnswersCorrectIndex: multichoiceAnswersCorrectIndex.present
            ? multichoiceAnswersCorrectIndex.value
            : this.multichoiceAnswersCorrectIndex,
        type: type ?? this.type,
        category: category ?? this.category,
        author: author ?? this.author,
        jeopardyWeight: jeopardyWeight ?? this.jeopardyWeight,
      );
  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('hint: $hint, ')
          ..write('image: $image, ')
          ..write('answer: $answer, ')
          ..write('multichoiceAnswers: $multichoiceAnswers, ')
          ..write(
              'multichoiceAnswersCorrectIndex: $multichoiceAnswersCorrectIndex, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('author: $author, ')
          ..write('jeopardyWeight: $jeopardyWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      question,
      hint,
      image,
      answer,
      multichoiceAnswers,
      multichoiceAnswersCorrectIndex,
      type,
      category,
      author,
      jeopardyWeight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.question == this.question &&
          other.hint == this.hint &&
          other.image == this.image &&
          other.answer == this.answer &&
          other.multichoiceAnswers == this.multichoiceAnswers &&
          other.multichoiceAnswersCorrectIndex ==
              this.multichoiceAnswersCorrectIndex &&
          other.type == this.type &&
          other.category == this.category &&
          other.author == this.author &&
          other.jeopardyWeight == this.jeopardyWeight);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> question;
  final Value<String?> hint;
  final Value<String?> image;
  final Value<String?> answer;
  final Value<String?> multichoiceAnswers;
  final Value<int?> multichoiceAnswersCorrectIndex;
  final Value<int> type;
  final Value<String> category;
  final Value<String> author;
  final Value<int> jeopardyWeight;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.hint = const Value.absent(),
    this.image = const Value.absent(),
    this.answer = const Value.absent(),
    this.multichoiceAnswers = const Value.absent(),
    this.multichoiceAnswersCorrectIndex = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.author = const Value.absent(),
    this.jeopardyWeight = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    required String question,
    this.hint = const Value.absent(),
    this.image = const Value.absent(),
    this.answer = const Value.absent(),
    this.multichoiceAnswers = const Value.absent(),
    this.multichoiceAnswersCorrectIndex = const Value.absent(),
    required int type,
    required String category,
    required String author,
    required int jeopardyWeight,
  })  : question = Value(question),
        type = Value(type),
        category = Value(category),
        author = Value(author),
        jeopardyWeight = Value(jeopardyWeight);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<String>? question,
    Expression<String>? hint,
    Expression<String>? image,
    Expression<String>? answer,
    Expression<String>? multichoiceAnswers,
    Expression<int>? multichoiceAnswersCorrectIndex,
    Expression<int>? type,
    Expression<String>? category,
    Expression<String>? author,
    Expression<int>? jeopardyWeight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (hint != null) 'hint': hint,
      if (image != null) 'image': image,
      if (answer != null) 'answer': answer,
      if (multichoiceAnswers != null) 'multichoice_answers': multichoiceAnswers,
      if (multichoiceAnswersCorrectIndex != null)
        'multichoice_answers_correct_index': multichoiceAnswersCorrectIndex,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (author != null) 'author': author,
      if (jeopardyWeight != null) 'jeopardy_weight': jeopardyWeight,
    });
  }

  QuestionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? question,
      Value<String?>? hint,
      Value<String?>? image,
      Value<String?>? answer,
      Value<String?>? multichoiceAnswers,
      Value<int?>? multichoiceAnswersCorrectIndex,
      Value<int>? type,
      Value<String>? category,
      Value<String>? author,
      Value<int>? jeopardyWeight}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      hint: hint ?? this.hint,
      image: image ?? this.image,
      answer: answer ?? this.answer,
      multichoiceAnswers: multichoiceAnswers ?? this.multichoiceAnswers,
      multichoiceAnswersCorrectIndex:
          multichoiceAnswersCorrectIndex ?? this.multichoiceAnswersCorrectIndex,
      type: type ?? this.type,
      category: category ?? this.category,
      author: author ?? this.author,
      jeopardyWeight: jeopardyWeight ?? this.jeopardyWeight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (hint.present) {
      map['hint'] = Variable<String>(hint.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (multichoiceAnswers.present) {
      map['multichoice_answers'] = Variable<String>(multichoiceAnswers.value);
    }
    if (multichoiceAnswersCorrectIndex.present) {
      map['multichoice_answers_correct_index'] =
          Variable<int>(multichoiceAnswersCorrectIndex.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (jeopardyWeight.present) {
      map['jeopardy_weight'] = Variable<int>(jeopardyWeight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('hint: $hint, ')
          ..write('image: $image, ')
          ..write('answer: $answer, ')
          ..write('multichoiceAnswers: $multichoiceAnswers, ')
          ..write(
              'multichoiceAnswersCorrectIndex: $multichoiceAnswersCorrectIndex, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('author: $author, ')
          ..write('jeopardyWeight: $jeopardyWeight')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuestionDatabase extends GeneratedDatabase {
  _$QuestionDatabase(QueryExecutor e) : super(e);
  late final $QuestionsTable questions = $QuestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questions];
}
