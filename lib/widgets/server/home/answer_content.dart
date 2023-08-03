import 'package:fluent_ui/fluent_ui.dart';
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/widgets/panel.dart';

class AnswerContent extends StatelessWidget {
  const AnswerContent({
    super.key,
    required this.vm,
  });

  final HomePaneVM vm;

  @override
  Widget build(BuildContext context) {
    if (!vm.withAnswers) {
      return const Expanded(child: SizedBox());
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: QPanel(
                child: Column(
                  children: [
                    for (var answer in vm.answers[vm.currentQIndex] ?? [])
                      ListTile(
                        title: Text(answer.clientName),
                        subtitle: Text(answer.answer),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
