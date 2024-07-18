import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:quiz/configuration/di.dart';
import 'package:quiz/pages/server/add_question/add_question_content.dart';
import 'package:quiz/pages/server/add_question/add_question_vm.dart';
import 'package:quiz/pages/server/home/home_pane_content.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/pages/server/question_management/question_management_content.dart';
import 'package:quiz/pages/server/question_management/question_management_vm.dart';

class ServerHome extends StatefulWidget {
  const ServerHome({
    super.key,
  });

  @override
  State<ServerHome> createState() => _ServerHomeState();
}

class _ServerHomeState extends State<ServerHome> {
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
          });
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.repeat_all, size: 18),
            title: const Text('Repeat'),
            body: ChangeNotifierProvider<HomePaneVM>(
              create: (context) => DI.get(),
              child: const HomePaneContent(),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.add_field, size: 18),
            title: const Text('Add Question'),
            body: ChangeNotifierProvider<AddQuestionVM>(
              create: (context) => DI.get(),
              child: const AddQuestionContent(),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.list, size: 18),
            title: const Text('Manage Questions'),
            body: ChangeNotifierProvider<QuestionManagementVM>(
              create: (context) => DI.get(),
              child: const QuestionManagementContent(),
            ),
          ),
        ],
      ),
    );
  }
}
