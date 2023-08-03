import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';

class QuizContentHeader extends StatelessWidget {
  const QuizContentHeader({
    super.key,
    required this.vm,
  });

  final HomePaneVM vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 32.0, bottom: 32.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Column(
            children: [
              Text("${vm.slide == 0 ? '-' : vm.slide}/${vm.questions.length * 2}"),
              const Icon(FluentIcons.chevron_left, size: 48),
            ],
          ),
          onPressed: () {
            vm.slide--;
          },
        ),
      ),
    );
  }
}

