import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/model.dart';
import 'package:quiz/ui/server/home/widgets/home_content/home_vm.dart';
import 'package:quiz/ui/server/home/widgets/pre_quiz_content/pre_quiz_content_vm.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class HomePaneVM extends ChangeNotifier {

  final HomeVM homeVM;
  final PreQuizContentVM preQuizVM;
  final QuizContentVM quizVM;

  HomeState state = HomeState.home;

  HomePaneVM(this.homeVM, this.preQuizVM, this.quizVM) {
    homeVM.init();
    quizVM.init();
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
}


enum HomeState {
  home,
  preQuiz,
  quiz,
}