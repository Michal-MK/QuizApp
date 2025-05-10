import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/server/home/widgets/answer_content/answers_content_vm.dart';
import 'package:quiz/ui/server/home/widgets/home_content/home_vm.dart';
import 'package:quiz/ui/server/home/widgets/pre_quiz_content/pre_quiz_content_vm.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class HomePaneVM extends ChangeNotifier {

  final HomeVM homeVM;
  final PreQuizContentVM preQuizVM;
  final QuizContentVM quizVM;
  final AnswersContentVM answersVM;

  HomeState state = HomeState.home;

  HomePaneVM(this.homeVM, this.preQuizVM, this.quizVM, this.answersVM) {
    homeVM.init();
    quizVM.init(preQuizVM.questionService, preQuizVM.connectedClients);
  }

  Future reset() async {
    state = HomeState.home;
    await quizVM.reset();
    notifyListeners();
  }

  Future<void> viewQuiz(int quizId) async {
    await preQuizVM.load(quizId);
    state = HomeState.preQuiz;
    notifyListeners();
  }

  Future<void> startQuiz(Quiz quiz) async {
    state = HomeState.quiz;
    await quizVM.startQuiz(quiz);
    notifyListeners();
  }

  Future<void> completeQuiz() async {
    state = HomeState.answer;
    await answersVM.init(quizVM.questions, quizVM.answers, quizVM.connectedClients);
    notifyListeners();
  }
}


enum HomeState {
  home,
  preQuiz,
  quiz,
  answer,
}