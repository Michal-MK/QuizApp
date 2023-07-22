import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/question_service.dart';
import 'package:quiz/widgets/q_server/add_question/add_question_content.dart';
import 'package:quiz/widgets/q_server/add_question/add_question_vm.dart';
import 'package:quiz/widgets/q_server/home/home_pane_content.dart';
import 'package:quiz/widgets/q_server/home/home_pane_vm.dart';
import 'package:quiz/widgets/q_server/question_management/question_management_content.dart';
import 'package:quiz/widgets/q_server/question_management/question_management_vm.dart';

class ServerHome extends StatefulWidget {
  final QuestionService service;

  const ServerHome({
    required this.service,
    super.key,
  });

  @override
  State<ServerHome> createState() => _ServerHomeState();
}

class _ServerHomeState extends State<ServerHome> {
  final HomePaneVM homeVm = HomePaneVM();
  final AddQuestionVM addQVm = AddQuestionVM();
  final QuestionManagementVM qListVm = QuestionManagementVM();

  int selectedPane = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        displayMode: PaneDisplayMode.compact,
        header: const Center(
          child: Text(
            "Quiz App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        selected: selectedPane,
        onChanged: (value) {
          setState(() {
            selectedPane = value;
            if (selectedPane == 2) {
              qListVm.loadQuestions();
            }
          });
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.repeat_all, size: 18),
            title: const Text('Repeat'),
            onTap: () {
              setState(() async {
                await homeVm.reloadQuestions(notify: false);
                homeVm.slide = 0;
                homeVm.preQuiz = true;
                homeVm.answers.clear();
                homeVm.notify();
              });
            },
            body: ChangeNotifierProvider.value(
              value: homeVm,
              child: HomePaneContent(service: widget.service),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.add_field, size: 18),
            title: const Text('Add Question'),
            body: ChangeNotifierProvider.value(
              value: addQVm,
              child: const AddQuestionContent(),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.list, size: 18),
            title: const Text('Manage Questions'),
            body: ChangeNotifierProvider.value(
              value: qListVm,
              child: const QuestionManagementContent(),
            ),
          ),
        ],
      ),
    );
  }
}
