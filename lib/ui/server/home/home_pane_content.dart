import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/server/home/widgets/home_content/home_content.dart';
import 'package:quiz/ui/server/home/widgets/pre_quiz_content/pre_quiz_content.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content.dart';

class HomePaneContent extends StatelessWidget {
  const HomePaneContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeVm = context.watch<HomePaneVM>();
    if (homeVm.state == HomeState.preQuiz) {
      return ChangeNotifierProvider.value(value: homeVm.preQuizVM, child: const PreQuizContent());
    } else if (homeVm.state == HomeState.quiz) {
      return ChangeNotifierProvider.value(value: homeVm.quizVM, child: const QuizContent());
    }
    return ChangeNotifierProvider.value(value: homeVm.homeVM, child: const HomeContent());
  }
}
