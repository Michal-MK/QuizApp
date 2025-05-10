import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/server/home/widgets/question_background.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_body.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_footer.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_header.dart';
import 'package:quiz/ui/server/home/widgets/quiz_content/quiz_content_vm.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<QuizContentVM>();

    return QuestionBackground(
      activeQuestion: vm.activeQuestion,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuizContentHeader(
            slide: vm.slide,
            activeQuestion: vm.activeQuestion,
            slideCount: vm.questions.length,
            backCallback: () {
              vm.slide--;
            },
          ),
          Expanded(
            child: QuizContentBody(vm: vm),
          ),
          QuizContentFooter(
            slide: vm.slide,
            slideCount: vm.questions.length,
            activeQuestion: vm.activeQuestion,
            forwardCallback: () {
              vm.slide++;
            },
            finishCallback: () {
              vm.markNoAnswer();
              context.read<HomePaneVM>().completeQuiz();
            },
          ),
        ],
      ),
    );
  }
}
