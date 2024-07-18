import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/ui/server/home/widgets/pre_quiz_content/pre_quiz_content_vm.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class HomePaneVM extends ChangeNotifier {

  final PreQuizContentVM preQuizVM;
  final QuizContentVM quizVM;

  bool preQuiz = true;

  HomePaneVM(this.preQuizVM, this.quizVM) {
    preQuizVM.init();
    quizVM.init();
  }

  Future reset() async {
    preQuiz = true;
    await preQuizVM.reset();
    await quizVM.reset();
    notifyListeners();
  }

  void startQuiz() {
    preQuiz = false;
    notifyListeners();
    // TODO
  }
}
