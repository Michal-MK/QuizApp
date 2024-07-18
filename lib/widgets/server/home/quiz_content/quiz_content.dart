import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/widgets/server/home/question_background.dart';
import 'package:quiz/widgets/server/home/quiz_content/quiz_content_body.dart';
import 'package:quiz/widgets/server/home/quiz_content/quiz_content_footer.dart';
import 'package:quiz/widgets/server/home/quiz_content/quiz_content_header.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePaneVM vm = context.watch<HomePaneVM>();

    return QuestionBackground(
      activeQuestion: vm.activeQuestion,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuizContentHeader(vm: vm),
          Expanded(
            child: QuizContentBody(vm: vm),
          ),
          QuizContentFooter(vm: vm),
        ],
      ),
    );
  }
}
