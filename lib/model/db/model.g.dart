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
      'id', aliasedName, true,
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
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
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
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
  final int? id;
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
      {this.id,
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
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
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
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
      id: serializer.fromJson<int?>(json['id']),
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
      'id': serializer.toJson<int?>(id),
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
          {Value<int?> id = const Value.absent(),
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
        id: id.present ? id.value : this.id,
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
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      hint: data.hint.present ? data.hint.value : this.hint,
      image: data.image.present ? data.image.value : this.image,
      answer: data.answer.present ? data.answer.value : this.answer,
      multichoiceAnswers: data.multichoiceAnswers.present
          ? data.multichoiceAnswers.value
          : this.multichoiceAnswers,
      multichoiceAnswersCorrectIndex:
          data.multichoiceAnswersCorrectIndex.present
              ? data.multichoiceAnswersCorrectIndex.value
              : this.multichoiceAnswersCorrectIndex,
      type: data.type.present ? data.type.value : this.type,
      category: data.category.present ? data.category.value : this.category,
      author: data.author.present ? data.author.value : this.author,
      jeopardyWeight: data.jeopardyWeight.present
          ? data.jeopardyWeight.value
          : this.jeopardyWeight,
    );
  }

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
  final Value<int?> id;
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
      {Value<int?>? id,
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

class $QuizesTable extends Quizes with TableInfo<$QuizesTable, Quiz> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _quizNameMeta =
      const VerificationMeta('quizName');
  @override
  late final GeneratedColumn<String> quizName = GeneratedColumn<String>(
      'quiz_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 512),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<int> dateCreated = GeneratedColumn<int>(
      'date_created', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, quizName, author, dateCreated, description, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz';
  @override
  VerificationContext validateIntegrity(Insertable<Quiz> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quiz_name')) {
      context.handle(_quizNameMeta,
          quizName.isAcceptableOrUnknown(data['quiz_name']!, _quizNameMeta));
    } else if (isInserting) {
      context.missing(_quizNameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quiz map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quiz(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      quizName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quiz_name'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date_created'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $QuizesTable createAlias(String alias) {
    return $QuizesTable(attachedDatabase, alias);
  }
}

class Quiz extends DataClass implements Insertable<Quiz> {
  final int? id;
  final String quizName;
  final String author;
  final int dateCreated;
  final String? description;
  final String? image;
  const Quiz(
      {this.id,
      required this.quizName,
      required this.author,
      required this.dateCreated,
      this.description,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['quiz_name'] = Variable<String>(quizName);
    map['author'] = Variable<String>(author);
    map['date_created'] = Variable<int>(dateCreated);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  QuizesCompanion toCompanion(bool nullToAbsent) {
    return QuizesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      quizName: Value(quizName),
      author: Value(author),
      dateCreated: Value(dateCreated),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory Quiz.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quiz(
      id: serializer.fromJson<int?>(json['id']),
      quizName: serializer.fromJson<String>(json['quizName']),
      author: serializer.fromJson<String>(json['author']),
      dateCreated: serializer.fromJson<int>(json['dateCreated']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'quizName': serializer.toJson<String>(quizName),
      'author': serializer.toJson<String>(author),
      'dateCreated': serializer.toJson<int>(dateCreated),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
    };
  }

  Quiz copyWith(
          {Value<int?> id = const Value.absent(),
          String? quizName,
          String? author,
          int? dateCreated,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent()}) =>
      Quiz(
        id: id.present ? id.value : this.id,
        quizName: quizName ?? this.quizName,
        author: author ?? this.author,
        dateCreated: dateCreated ?? this.dateCreated,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
      );
  Quiz copyWithCompanion(QuizesCompanion data) {
    return Quiz(
      id: data.id.present ? data.id.value : this.id,
      quizName: data.quizName.present ? data.quizName.value : this.quizName,
      author: data.author.present ? data.author.value : this.author,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quiz(')
          ..write('id: $id, ')
          ..write('quizName: $quizName, ')
          ..write('author: $author, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, quizName, author, dateCreated, description, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quiz &&
          other.id == this.id &&
          other.quizName == this.quizName &&
          other.author == this.author &&
          other.dateCreated == this.dateCreated &&
          other.description == this.description &&
          other.image == this.image);
}

class QuizesCompanion extends UpdateCompanion<Quiz> {
  final Value<int?> id;
  final Value<String> quizName;
  final Value<String> author;
  final Value<int> dateCreated;
  final Value<String?> description;
  final Value<String?> image;
  const QuizesCompanion({
    this.id = const Value.absent(),
    this.quizName = const Value.absent(),
    this.author = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  });
  QuizesCompanion.insert({
    this.id = const Value.absent(),
    required String quizName,
    required String author,
    required int dateCreated,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
  })  : quizName = Value(quizName),
        author = Value(author),
        dateCreated = Value(dateCreated);
  static Insertable<Quiz> custom({
    Expression<int>? id,
    Expression<String>? quizName,
    Expression<String>? author,
    Expression<int>? dateCreated,
    Expression<String>? description,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quizName != null) 'quiz_name': quizName,
      if (author != null) 'author': author,
      if (dateCreated != null) 'date_created': dateCreated,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
    });
  }

  QuizesCompanion copyWith(
      {Value<int?>? id,
      Value<String>? quizName,
      Value<String>? author,
      Value<int>? dateCreated,
      Value<String?>? description,
      Value<String?>? image}) {
    return QuizesCompanion(
      id: id ?? this.id,
      quizName: quizName ?? this.quizName,
      author: author ?? this.author,
      dateCreated: dateCreated ?? this.dateCreated,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quizName.present) {
      map['quiz_name'] = Variable<String>(quizName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<int>(dateCreated.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizesCompanion(')
          ..write('id: $id, ')
          ..write('quizName: $quizName, ')
          ..write('author: $author, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('description: $description, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $QuizQuestionsTable extends QuizQuestions
    with TableInfo<$QuizQuestionsTable, QuizQuestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<int> quizId = GeneratedColumn<int>(
      'quiz_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [quizId, questionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_questions';
  @override
  VerificationContext validateIntegrity(Insertable<QuizQuestion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quiz_id')) {
      context.handle(_quizIdMeta,
          quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta));
    } else if (isInserting) {
      context.missing(_quizIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {quizId, questionId};
  @override
  QuizQuestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizQuestion(
      quizId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quiz_id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
    );
  }

  @override
  $QuizQuestionsTable createAlias(String alias) {
    return $QuizQuestionsTable(attachedDatabase, alias);
  }
}

class QuizQuestion extends DataClass implements Insertable<QuizQuestion> {
  final int quizId;
  final int questionId;
  const QuizQuestion({required this.quizId, required this.questionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['quiz_id'] = Variable<int>(quizId);
    map['question_id'] = Variable<int>(questionId);
    return map;
  }

  QuizQuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuizQuestionsCompanion(
      quizId: Value(quizId),
      questionId: Value(questionId),
    );
  }

  factory QuizQuestion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizQuestion(
      quizId: serializer.fromJson<int>(json['quizId']),
      questionId: serializer.fromJson<int>(json['questionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'quizId': serializer.toJson<int>(quizId),
      'questionId': serializer.toJson<int>(questionId),
    };
  }

  QuizQuestion copyWith({int? quizId, int? questionId}) => QuizQuestion(
        quizId: quizId ?? this.quizId,
        questionId: questionId ?? this.questionId,
      );
  QuizQuestion copyWithCompanion(QuizQuestionsCompanion data) {
    return QuizQuestion(
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizQuestion(')
          ..write('quizId: $quizId, ')
          ..write('questionId: $questionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(quizId, questionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizQuestion &&
          other.quizId == this.quizId &&
          other.questionId == this.questionId);
}

class QuizQuestionsCompanion extends UpdateCompanion<QuizQuestion> {
  final Value<int> quizId;
  final Value<int> questionId;
  final Value<int> rowid;
  const QuizQuestionsCompanion({
    this.quizId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizQuestionsCompanion.insert({
    required int quizId,
    required int questionId,
    this.rowid = const Value.absent(),
  })  : quizId = Value(quizId),
        questionId = Value(questionId);
  static Insertable<QuizQuestion> custom({
    Expression<int>? quizId,
    Expression<int>? questionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (quizId != null) 'quiz_id': quizId,
      if (questionId != null) 'question_id': questionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizQuestionsCompanion copyWith(
      {Value<int>? quizId, Value<int>? questionId, Value<int>? rowid}) {
    return QuizQuestionsCompanion(
      quizId: quizId ?? this.quizId,
      questionId: questionId ?? this.questionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (quizId.present) {
      map['quiz_id'] = Variable<int>(quizId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizQuestionsCompanion(')
          ..write('quizId: $quizId, ')
          ..write('questionId: $questionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuizDatabase extends GeneratedDatabase {
  _$QuizDatabase(QueryExecutor e) : super(e);
  $QuizDatabaseManager get managers => $QuizDatabaseManager(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $QuizesTable quizes = $QuizesTable(this);
  late final $QuizQuestionsTable quizQuestions = $QuizQuestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [questions, quizes, quizQuestions];
}

typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  Value<int?> id,
  required String question,
  Value<String?> hint,
  Value<String?> image,
  Value<String?> answer,
  Value<String?> multichoiceAnswers,
  Value<int?> multichoiceAnswersCorrectIndex,
  required int type,
  required String category,
  required String author,
  required int jeopardyWeight,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<int?> id,
  Value<String> question,
  Value<String?> hint,
  Value<String?> image,
  Value<String?> answer,
  Value<String?> multichoiceAnswers,
  Value<int?> multichoiceAnswersCorrectIndex,
  Value<int> type,
  Value<String> category,
  Value<String> author,
  Value<int> jeopardyWeight,
});

class $$QuestionsTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder> {
  $$QuestionsTableTableManager(_$QuizDatabase db, $QuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$QuestionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$QuestionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String?> hint = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> answer = const Value.absent(),
            Value<String?> multichoiceAnswers = const Value.absent(),
            Value<int?> multichoiceAnswersCorrectIndex = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<int> jeopardyWeight = const Value.absent(),
          }) =>
              QuestionsCompanion(
            id: id,
            question: question,
            hint: hint,
            image: image,
            answer: answer,
            multichoiceAnswers: multichoiceAnswers,
            multichoiceAnswersCorrectIndex: multichoiceAnswersCorrectIndex,
            type: type,
            category: category,
            author: author,
            jeopardyWeight: jeopardyWeight,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String question,
            Value<String?> hint = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> answer = const Value.absent(),
            Value<String?> multichoiceAnswers = const Value.absent(),
            Value<int?> multichoiceAnswersCorrectIndex = const Value.absent(),
            required int type,
            required String category,
            required String author,
            required int jeopardyWeight,
          }) =>
              QuestionsCompanion.insert(
            id: id,
            question: question,
            hint: hint,
            image: image,
            answer: answer,
            multichoiceAnswers: multichoiceAnswers,
            multichoiceAnswersCorrectIndex: multichoiceAnswersCorrectIndex,
            type: type,
            category: category,
            author: author,
            jeopardyWeight: jeopardyWeight,
          ),
        ));
}

class $$QuestionsTableFilterComposer
    extends FilterComposer<_$QuizDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get question => $state.composableBuilder(
      column: $state.table.question,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hint => $state.composableBuilder(
      column: $state.table.hint,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get answer => $state.composableBuilder(
      column: $state.table.answer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get multichoiceAnswers => $state.composableBuilder(
      column: $state.table.multichoiceAnswers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get multichoiceAnswersCorrectIndex => $state
      .composableBuilder(
          column: $state.table.multichoiceAnswersCorrectIndex,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get jeopardyWeight => $state.composableBuilder(
      column: $state.table.jeopardyWeight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$QuestionsTableOrderingComposer
    extends OrderingComposer<_$QuizDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get question => $state.composableBuilder(
      column: $state.table.question,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hint => $state.composableBuilder(
      column: $state.table.hint,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get answer => $state.composableBuilder(
      column: $state.table.answer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get multichoiceAnswers => $state.composableBuilder(
      column: $state.table.multichoiceAnswers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get multichoiceAnswersCorrectIndex =>
      $state.composableBuilder(
          column: $state.table.multichoiceAnswersCorrectIndex,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get jeopardyWeight => $state.composableBuilder(
      column: $state.table.jeopardyWeight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$QuizesTableCreateCompanionBuilder = QuizesCompanion Function({
  Value<int?> id,
  required String quizName,
  required String author,
  required int dateCreated,
  Value<String?> description,
  Value<String?> image,
});
typedef $$QuizesTableUpdateCompanionBuilder = QuizesCompanion Function({
  Value<int?> id,
  Value<String> quizName,
  Value<String> author,
  Value<int> dateCreated,
  Value<String?> description,
  Value<String?> image,
});

class $$QuizesTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $QuizesTable,
    Quiz,
    $$QuizesTableFilterComposer,
    $$QuizesTableOrderingComposer,
    $$QuizesTableCreateCompanionBuilder,
    $$QuizesTableUpdateCompanionBuilder> {
  $$QuizesTableTableManager(_$QuizDatabase db, $QuizesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$QuizesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$QuizesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> quizName = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<int> dateCreated = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
          }) =>
              QuizesCompanion(
            id: id,
            quizName: quizName,
            author: author,
            dateCreated: dateCreated,
            description: description,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String quizName,
            required String author,
            required int dateCreated,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
          }) =>
              QuizesCompanion.insert(
            id: id,
            quizName: quizName,
            author: author,
            dateCreated: dateCreated,
            description: description,
            image: image,
          ),
        ));
}

class $$QuizesTableFilterComposer
    extends FilterComposer<_$QuizDatabase, $QuizesTable> {
  $$QuizesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get quizName => $state.composableBuilder(
      column: $state.table.quizName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dateCreated => $state.composableBuilder(
      column: $state.table.dateCreated,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$QuizesTableOrderingComposer
    extends OrderingComposer<_$QuizDatabase, $QuizesTable> {
  $$QuizesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get quizName => $state.composableBuilder(
      column: $state.table.quizName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dateCreated => $state.composableBuilder(
      column: $state.table.dateCreated,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$QuizQuestionsTableCreateCompanionBuilder = QuizQuestionsCompanion
    Function({
  required int quizId,
  required int questionId,
  Value<int> rowid,
});
typedef $$QuizQuestionsTableUpdateCompanionBuilder = QuizQuestionsCompanion
    Function({
  Value<int> quizId,
  Value<int> questionId,
  Value<int> rowid,
});

class $$QuizQuestionsTableTableManager extends RootTableManager<
    _$QuizDatabase,
    $QuizQuestionsTable,
    QuizQuestion,
    $$QuizQuestionsTableFilterComposer,
    $$QuizQuestionsTableOrderingComposer,
    $$QuizQuestionsTableCreateCompanionBuilder,
    $$QuizQuestionsTableUpdateCompanionBuilder> {
  $$QuizQuestionsTableTableManager(_$QuizDatabase db, $QuizQuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$QuizQuestionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$QuizQuestionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> quizId = const Value.absent(),
            Value<int> questionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuizQuestionsCompanion(
            quizId: quizId,
            questionId: questionId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int quizId,
            required int questionId,
            Value<int> rowid = const Value.absent(),
          }) =>
              QuizQuestionsCompanion.insert(
            quizId: quizId,
            questionId: questionId,
            rowid: rowid,
          ),
        ));
}

class $$QuizQuestionsTableFilterComposer
    extends FilterComposer<_$QuizDatabase, $QuizQuestionsTable> {
  $$QuizQuestionsTableFilterComposer(super.$state);
  ColumnFilters<int> get quizId => $state.composableBuilder(
      column: $state.table.quizId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get questionId => $state.composableBuilder(
      column: $state.table.questionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$QuizQuestionsTableOrderingComposer
    extends OrderingComposer<_$QuizDatabase, $QuizQuestionsTable> {
  $$QuizQuestionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get quizId => $state.composableBuilder(
      column: $state.table.quizId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get questionId => $state.composableBuilder(
      column: $state.table.questionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $QuizDatabaseManager {
  final _$QuizDatabase _db;
  $QuizDatabaseManager(this._db);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$QuizesTableTableManager get quizes =>
      $$QuizesTableTableManager(_db, _db.quizes);
  $$QuizQuestionsTableTableManager get quizQuestions =>
      $$QuizQuestionsTableTableManager(_db, _db.quizQuestions);
}
