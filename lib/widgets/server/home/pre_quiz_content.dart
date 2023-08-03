import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:quiz/pages/server/home/home_pane_vm.dart';
import 'package:quiz/widgets/panel.dart';

class PreQuizContent extends StatelessWidget {
  final HomePaneVM homePaneModel;

  const PreQuizContent({
    required this.homePaneModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              homePaneModel.quizName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 52),
            ),
            const SizedBox(height: 32),
            Text(
              "Questions: ${homePaneModel.questions.length}",
              style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: QPanel(
                child: IconButton(
                  onPressed: homePaneModel.reloadQuestions,
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
