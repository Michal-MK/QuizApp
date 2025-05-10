import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:provider/provider.dart';
import 'package:quiz/services/localization_cubit.dart';
import 'package:quiz/theme/theme.dart';
import 'package:quiz/ui/common/q_client_panel.dart';
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
    final l = context.read<LocalizationCubit>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Info", style: TextStyle(fontSize: 32)),
                IconButton(
                  onPressed: () {
                    var homePaneVM = context.read<HomePaneVM>();
                    homePaneVM.reset();
                  },
                  icon: const Icon(Icons.close, size: 32),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              preQuizVM.quiz?.quizName ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 52),
            ),
            const SizedBox(height: 32),
            Text(
              "Questions: ${preQuizVM.questions?.length}",
              style: const TextStyle(fontSize: 24),
            ),
            Row(
              children: [
                ...preQuizVM.questionsByType.entries.map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QPanel(
                        tint: questionTypeColor(e.key),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(l.questionNameForType(e.key), style: const TextStyle(fontSize: 24), textAlign: TextAlign.center),
                            Text(e.value.length.toString(), style: const TextStyle(fontSize: 24), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text("Participants:", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            SizedBox(height: 200, child: QClientPanel(clients: preQuizVM.connectedClients)),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: QPanel(
                child: IconButton(
                  onPressed: () {
                    var homePaneVM = context.read<HomePaneVM>();
                    homePaneVM.startQuiz(homePaneVM.preQuizVM.quiz!);
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
