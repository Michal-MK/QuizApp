import 'package:flutter/foundation.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/model/question_repo.dart';
import 'package:quiz/model/quiz_repo.dart';
import 'package:quiz/proto_gen/questions.pbenum.dart';

class DebugVM extends ChangeNotifier {
  final QuizRepo quizRepo;
  final QuestionRepo questionRepo;

  DebugVM(this.questionRepo, this.quizRepo);

  Future<void> seedData() async {
    
    Quiz q = Quiz(
      quizName: "Sample Quiz for Debugging",
      author: "Admin",
      description: "This is a sample quiz. That will test the app and your basic knowledge.",
      dateCreated: DateTime.now().millisecondsSinceEpoch,
    );

    int quizId = await quizRepo.save(q);

    Question q1 = Question(
      question: "What is the capital of France?",
      answer: "Paris",
      hint: "It's also known as the city of lights.",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.text.value,
    );
    Question q2 = Question(
      question: "What is the largest planet in our solar system?",
      answer: "Jupiter",
      hint: "It's known for its Great Red Spot.",
      category: "Astronomy",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.text.value,
    );
    Question q3 = Question(
      question: "What is the chemical symbol for gold?",
      answer: "Au",
      category: "Chemistry",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.text.value,
    );
    Question q4 = Question(
      question: "What is the speed of light?",
      answer: "299792458 m/s",
      hint: "It's approximately 300,000 km/s.",
      category: "Physics",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.text.value,
    );
    Question q5 = Question(
      question: "What is the largest mammal?",
      answer: "Blue Whale",
      hint: "Aquatic?",
      category: "Biology",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.text.value,
    );

    Question q6 = Question(
      question: "How tall is the Eiffel Tower?",
      answer: "300",
      hint: "It's in Paris. Duh",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.number.value,
    );
    Question q7 = Question(
      question: "What is the boiling point of water?",
      answer: "100",
      hint: "It's in Celsius.",
      category: "Chemistry",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.number.value,
    );
    Question q8 = Question(
      question: "What is the square root of 16?",
      answer: "4",
      category: "Mathematics",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.number.value,
    );

    Question q9 = Question(
      question: "Is the sky blue?",
      answer: "true",
      category: "General Knowledge",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.trueFalse.value,
    );
    Question q10 = Question(
      question: "Is the earth flat?",
      answer: "false",
      category: "General Knowledge",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.trueFalse.value,
    );

    Question q11 = Question(
      question: "How many continents are there?----7;6;8;5",
      answer: "7",
      category: "General Knowledge",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.multipleChoice.value,
    );
    Question q12 = Question(
      question: "What is the capital of Germany?----Berlin;Munich;Frankfurt;Hamburg",
      answer: "Berlin",
      hint: "It's known for its Brandenburg Gate.",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.multipleChoice.value,
    );
    Question q13 = Question(
      question: "What is the largest ocean?----Pacific;Atlantic;Indian;Arctic",
      answer: "Pacific",
      hint: "It's the largest and deepest ocean.",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.multipleChoice.value,
    );

    Question q14 = Question(
      question: "Where is this place?----img1.jpg",
      answer: "0.000000;0.0000000",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.location.value,
    );
    Question q15 = Question(
      question: "Where is this place?----img2.jpg",
      answer: "50.095716;14.439244",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.location.value,
    );
    Question q16 = Question(
      question: "Where is this place?----img3.jpg",
      answer: "51.507983;-0.087679",
      category: "Geography",
      author: "Admin",
      jeopardyWeight: 1,
      type: QuestionType.location.value,
    );

    await questionRepo.saveAndAddToQuiz(q1, quizId);
    await questionRepo.saveAndAddToQuiz(q2, quizId);
    await questionRepo.saveAndAddToQuiz(q3, quizId);
    await questionRepo.saveAndAddToQuiz(q4, quizId);
    await questionRepo.saveAndAddToQuiz(q5, quizId);
    await questionRepo.saveAndAddToQuiz(q6, quizId);
    await questionRepo.saveAndAddToQuiz(q7, quizId);
    await questionRepo.saveAndAddToQuiz(q8, quizId);
    await questionRepo.saveAndAddToQuiz(q9, quizId);
    await questionRepo.saveAndAddToQuiz(q10, quizId);
    await questionRepo.saveAndAddToQuiz(q11, quizId);
    await questionRepo.saveAndAddToQuiz(q12, quizId);
    await questionRepo.saveAndAddToQuiz(q13, quizId);
    await questionRepo.saveAndAddToQuiz(q14, quizId);
    await questionRepo.saveAndAddToQuiz(q15, quizId);
    await questionRepo.saveAndAddToQuiz(q16, quizId);

    notifyListeners();
  }

  Future<void> clearData() async {
    final qs = await questionRepo.getQuestions();
    for (var question in qs) {
      await questionRepo.delete(question.id!);
    }
    final quizes = await quizRepo.getQuizes();
    for (var quiz in quizes) {
      await quizRepo.delete(quiz.id!);
    }
    for (var quiz in quizes) {
      final linkedQuestions = await quizRepo.getLinkedQuestions(quiz.id!);
      for (var question in linkedQuestions) {
        await questionRepo.unlinkFromQuiz(quiz.id!, question.id!);
      }
    }
    notifyListeners();
  }
}