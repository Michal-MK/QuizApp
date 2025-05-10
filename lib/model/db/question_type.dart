import 'package:quiz/definitions/question_type.dart';
import 'package:quiz/proto_gen/questions.pbenum.dart';

class AnnotatedQuestionType {
  final QuestionType id;
  final String name;
  const AnnotatedQuestionType(this.id, this.name);
}

List<AnnotatedQuestionType> questionTypes = const [
  AnnotatedQuestionType(QuestionType.text, 'Text'),
  AnnotatedQuestionType(QuestionType.number, 'Číslo'),
  AnnotatedQuestionType(QuestionType.multipleChoice, 'Výběr z možností'),
  AnnotatedQuestionType(QuestionType.trueFalse, 'Ano/Ne'),
  AnnotatedQuestionType(QuestionType.location, 'Geolokace'),
];

Map<int, QuestionType> questionTypesRev = {
  QuestionTypeNum.TextQuestion: QuestionType.text,
  QuestionTypeNum.NumberQuestion: QuestionType.number,
  QuestionTypeNum.MultichoiceQuestion: QuestionType.multipleChoice,
  QuestionTypeNum.TrueFalseQuestion: QuestionType.trueFalse,
  QuestionTypeNum.LocationQuestion: QuestionType.location,
};