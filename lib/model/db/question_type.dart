import 'package:quiz/proto_gen/questions.pbenum.dart';

class AnnotatedQuestionType {
  final QuestionType id;
  final String name;
  const AnnotatedQuestionType(this.id, this.name);
}

List<AnnotatedQuestionType> questionTypes = const [
  AnnotatedQuestionType(QuestionType.text, 'Text'),
  AnnotatedQuestionType(QuestionType.number, 'Number'),
  AnnotatedQuestionType(QuestionType.multipleChoice, 'Multiple Choice'),
  AnnotatedQuestionType(QuestionType.trueFalse, 'True/False'),
  AnnotatedQuestionType(QuestionType.location, 'Geolocation'),
];

Map<int, QuestionType> questionTypesRev = {
  0: QuestionType.text,
  1: QuestionType.number,
  2: QuestionType.multipleChoice,
  3: QuestionType.trueFalse,
  4: QuestionType.location,
};