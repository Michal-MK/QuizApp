import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/widgets/server/home/pre_quiz_content.dart';
import 'package:quiz/widgets/server/home/quiz_content/quiz_content.dart';

class HomePaneContent extends StatelessWidget {
  const HomePaneContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeVm = context.watch<HomePaneVM>();
    if (homeVm.preQuiz) {
      return const PreQuizContent();
    }
    return const QuizContent();
  }
}
