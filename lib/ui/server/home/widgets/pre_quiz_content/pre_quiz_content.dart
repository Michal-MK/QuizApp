import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:provider/provider.dart';
import 'package:quiz/ui/server/home/home_pane_vm.dart';
import 'package:quiz/ui/common/q_panel.dart';
import 'package:quiz/ui/server/home/widgets/pre_quiz_content/pre_quiz_content_vm.dart';

class PreQuizContent extends StatelessWidget {
  const PreQuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final preQuizVM = context.watch<PreQuizContentVM>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Info", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            Text(
              preQuizVM.quiz?.quizName ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 52),
            ),
            const SizedBox(height: 32),
            const Text(
              "Questions: TODO",
              style: TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: QPanel(
                child: IconButton(
                  onPressed: () {
                    var homePaneVM = context.read<HomePaneVM>();
                    homePaneVM.startQuiz(homePaneVM.preQuizVM.quiz!); // TODO
                  },
                  icon: const Icon(Icons.start, size: 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
