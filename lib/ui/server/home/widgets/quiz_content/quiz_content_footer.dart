import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/model/db/question_type.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';

class QuizContentFooter extends StatelessWidget {
  const QuizContentFooter({
    super.key,
    required this.vm,
  });

  final HomePaneVM vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                questionTypes[vm.activeQuestion?.type ?? 0].name,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            if (vm.slide + 1 != vm.questions.length * 2)
              IconButton(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(FluentIcons.chevron_right, size: 48),
                    Text("${vm.slide + 1 == vm.questions.length * 2 ? '-' : vm.slide + 2}/${vm.questions.length * 2}"),
                  ],
                ),
                onPressed: () {
                  vm.slide++;
                },
              ),
          ],
        ),
      ),
    );
  }
}
