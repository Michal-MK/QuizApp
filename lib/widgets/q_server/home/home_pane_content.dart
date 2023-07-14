import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/widgets/q_server/home/home_pane_vm.dart';
import 'package:quiz/widgets/q_server/home/pre_quiz_content.dart';
import 'package:quiz/widgets/q_server/home/question_presenter.dart';

class HomePaneContent extends StatefulWidget {
  final QuestionService service;

  const HomePaneContent({
    required this.service,
    super.key,
  });

  @override
  State<HomePaneContent> createState() => _HomePaneContentState();
}

class _HomePaneContentState extends State<HomePaneContent> {
  @override
  void didChangeDependencies() {
    context.read<HomePaneVM>().service = widget.service;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePaneVM>(
      builder: (context, vm, _) {
        if (vm.preQuiz) {
          return PreQuizContent(homePaneModel: vm);
        }
        return const QuestionPresenter();
      },
    );
  }
}
